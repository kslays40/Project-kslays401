import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// Replace YOUR_API_KEY with your actual API key
const apiKey = "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";
String apiUrl = "https://api.openai.com/v1/completions";
Uri uri = Uri.parse(apiUrl);

Future<String> generateText(String prompt) async {
  final response = await http.post(
    uri,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 1000,
      "temperature": 0.5
    }),
  );

  print(response.body);

  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    return responseJson['choices'][0]['text'].trim();
  } else {
    throw Exception("Failed to generate text");
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _messages = <String>[];

  void _sendMessage() async {
    String message = _textController.text;
    setState(() {
      _messages.add(message);
      _textController.clear();
    });

    String response = await _getResponse(message);
    setState(() {
      _messages.add(response);
    });
  }

  Future<String> _getResponse(String message) async {
    return await generateText(message);
  }

  Widget _buildMessage(String message, bool isUser) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: isUser ? Colors.blue[200] : Color(0xFF48bdff),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 10.0,
          right: 10.0,
          bottom: 10
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  children: _messages
                      .map((message) => _buildMessage(message, false))
                      .toList()),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter a message',
                        hintStyle: TextStyle(color: Color(0xFF48bdff))),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color(0xFF48bdff),
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
