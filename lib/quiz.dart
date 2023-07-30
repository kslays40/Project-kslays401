import 'dart:async';
import 'package:aithinkism/start.dart';
import 'package:flutter/material.dart';

class quizpage extends StatefulWidget {
  const quizpage({super.key});

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          StartPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/splashscreentemp.png"),
      ),
    );
  }
}

