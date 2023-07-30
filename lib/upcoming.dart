import 'package:flutter/material.dart';

class upcoming extends StatefulWidget {
  const upcoming({super.key});

  @override
  State<upcoming> createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/splashscreentemp.png"),
          Text("Upcoming Soon",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),)
        ],
      ),
    );
  }
}
