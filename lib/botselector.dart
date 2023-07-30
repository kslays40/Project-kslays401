import 'package:aithinkism/aakritloader.dart';
import 'package:aithinkism/bot.dart';
import 'package:aithinkism/chatgptbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class botselector extends StatefulWidget {
  const botselector({super.key});

  @override
  State<botselector> createState() => _botselectorState();
}

class _botselectorState extends State<botselector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bot()),
                );
              },
              child: Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Color(0xFFbfe8ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset("images/bard.png",height: 100,width: 100,),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chatgptbot()),
                );
              },
              child: Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Color(0xFFbfe8ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset("images/openai.png",height: 100,width: 100,),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aakritloader()),
                );
              },
              child: Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Color(0xFFbfe8ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("svgimg/bot.svg"),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
