import 'dart:async';
import 'package:aithinkism/router.dart';
import 'package:flutter/material.dart';

class loader extends StatefulWidget {
  const loader({super.key});

  @override
  State<loader> createState() => _loaderState();
}

class _loaderState extends State<loader> {

  @override
  void initState() {
    Timer(Duration(seconds: 10), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          router()));
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
