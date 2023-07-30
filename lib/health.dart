import 'package:flutter/material.dart';

class health extends StatefulWidget {
  const health({super.key});

  @override
  State<health> createState() => _healthState();
}

class _healthState extends State<health> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text("health Info"),
        ),
      ],
    );
  }
}
