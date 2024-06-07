import 'package:flutter/material.dart';

class FoundPage extends StatefulWidget {
  @override
  _FoundPageState createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  final TextEditingController _inputController = TextEditingController();
  List<Map<String, String>> _foundItems = [
    {'name': 'Aidos', 'message': 'Hey guys! 3 days ago I found an English book in Act hall'},
    {'name': 'Sabi', 'message': 'I found 10 dollars on the floor'},
    {'name': 'Laura', 'message': 'Guys, I found airpods. Whose are these?'}
  ];

  void _addFoundItem() {
    if (_inputController.text.isNotEmpty) {
      setState(() {
        _foundItems.add({'name': 'You', 'message': _inputController.text});
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

  void _sendPhoto() {
    // Function to handle sending a photo
    // You can integrate photo picking and sending functionality here
    print('Photo icon pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Found Items'),
        backgroundColor: Colors.purple[300]!,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _foundItems.length,
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
                        backgroundColor: Colors.purple[300]!,
                        child: Text(
                          _foundItems[index]['name']![0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        _foundItems[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_foundItems[index]['message']!),
                      trailing: ElevatedButton(
                        onPressed: () => _openChat(_foundItems[index]['name']!),
                        child: Text('Chat', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[300]!,
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
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.photo_camera, color: Colors.purple[300]!),
                  onPressed: _sendPhoto,
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.purple[300]!),
                  onPressed: _addFoundItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
