import 'dart:async';
import 'package:aithinkism/chatgptchat.dart';
import 'package:flutter/material.dart';

class chatgptbot extends StatefulWidget {
  const chatgptbot({super.key});

  @override
  State<chatgptbot> createState() => _chatgptbotState();
}

class _chatgptbotState extends State<chatgptbot> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          chatgptchat()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/splashscreentemp.png"),
        ],
      ),
    );
  }
}
