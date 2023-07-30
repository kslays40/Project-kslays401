import 'package:aithinkism/botselector.dart';
import 'package:aithinkism/classinfo.dart';
import 'package:aithinkism/health.dart';
import 'package:aithinkism/home.dart';
import 'package:aithinkism/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class router extends StatefulWidget {
  const router({super.key});

  @override
  State<router> createState() => _routerState();
}

class _routerState extends State<router> {
  var _currentIndex = 0;
  final widgetOptions = [
    home(),
    classinfo(),
    botselector(),
    health(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: Color(0xFF60bcfa),
        items: [
          /// Home
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "svgimg/home.svg",
                height: 50,
                width: 0,
              ),
              activeIcon: SvgPicture.asset(
                "svgimg/homeselect.svg",
                height: 20,
                width: 20,
              ),
              label: ""),

          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "svgimg/study.svg",
                height: 50,
                width: 0,
              ),
              activeIcon: SvgPicture.asset(
                "svgimg/Studyselect.svg",
                height: 20,
                width: 20,
              ),
              label: ""),

          /// Search
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "svgimg/bot.svg",
                height: 40,
                width: 0,
              ),
              label: ""),

          /// Profile
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "svgimg/health.svg",
                height: 50,
                width: 0,
              ),
              activeIcon: SvgPicture.asset(
                "svgimg/healthselect.svg",
                height: 20,
                width: 20,
              ),
              label: ""),

          /// Quiz
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "svgimg/profile.svg",
                height: 50,
                width: 0,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 20,
              ),
              label: ""),
        ],
      ),
    );
  }
}
