import 'dart:async';
import 'package:aithinkism/googlenews.dart';
import 'package:flutter/material.dart';

class googlenewsloader extends StatefulWidget {
  const googlenewsloader({super.key});

  @override
  State<googlenewsloader> createState() => _googlenewsloaderState();
}

class _googlenewsloaderState extends State<googlenewsloader> {
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          googlenews()));
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
