import 'package:flutter/material.dart';
import 'chat_page.dart';

class LostPage extends StatefulWidget {
  @override
  _LostPageState createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  final TextEditingController _inputController = TextEditingController();
  List<Map<String, String>> _lostItems = [
    {
      'name': 'Erasyl',
      'message': 'Hey guys! I 3 days ago i ve lost my English book in Act hall'
    },
    {
      'name': 'Asem',
      'message': 'Who took my dollars 10 ,it was on my desk.Please return it back'
    },
    {
      'name': 'Nurzhan',
      'message': 'Hello, i couldn\'t find my airpods. If u saw , text me back'
    }
  ];

  void _addLostItem() {
    if (_inputController.text.isNotEmpty) {
      setState(() {
        _lostItems.add({'name': 'You', 'message': _inputController.text});
        _inputController.clear();
      });
    }
  }

  void _openChat(String name) {
    Navigator.pushNamed(
      context,
      '/chat',
      arguments: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost Items'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _lostItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          _lostItems[index]['name']![0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        _lostItems[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_lostItems[index]['message']!),
                      trailing: ElevatedButton(
                        onPressed: () => _openChat(_lostItems[index]['name']!),
                        child: Text('Chat'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          textStyle: TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: Colors.amber),
                        onPressed: _addLostItem,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
