import 'dart:async';
import 'package:aithinkism/aakrit.dart';
import 'package:flutter/material.dart';

class aakritloader extends StatefulWidget {
  const aakritloader({super.key});

  @override
  State<aakritloader> createState() => _aakritloaderState();
}

class _aakritloaderState extends State<aakritloader> {
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          ChatScreen()));
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
