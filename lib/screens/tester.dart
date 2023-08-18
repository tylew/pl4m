import 'package:flutter/material.dart';
import 'package:map_app/components/map_component.dart';

class MyTestWidget extends StatefulWidget {
  const MyTestWidget({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyTestWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      // Perform actions with the message, such as sending it
      print('Message sent: $message');
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
        title: const Text('Platform'),
      ),
      body: Column(
        children: [
          const Expanded(child: MapComponent()
              // Container(
              //   color: Colors.grey[200],
              //   child: Center(
              //     child: Text(
              //       'Main Content',
              //       style: TextStyle(fontSize: 24),
              //     ),
              //   ),
              // ),
              ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // onTap: () => context.,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
