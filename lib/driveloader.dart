import 'dart:async';

import 'package:aithinkism/drivepdf.dart';
import 'package:flutter/material.dart';

class driveloader extends StatefulWidget {
  const driveloader({super.key});

  @override
  State<driveloader> createState() => _driveloaderState();
}

class _driveloaderState extends State<driveloader> {
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          drivepdf()));
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
