import 'dart:ui';
import 'package:aithinkism/classchoose.dart';
import 'package:aithinkism/driveloader.dart';
import 'package:aithinkism/quiz.dart';
import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

//content details
class Item {
  String name;
  String image;
  String link;

  Item({required this.name, required this.image, required this.link});
}

//content list
List<Item> items = [
  Item(name: 'Maths', image: 'images/maths.png', link: 'fruit'),
  Item(name: 'English', image: 'images/english.png', link: 'fruit'),
  Item(name: 'Science', image: 'images/science.png', link: 'fruit'),
  Item(name: 'Hindi', image: 'images/hindi.png', link: 'fruit'),
  Item(name: 'Social Science', image: 'images/sst.png', link: 'fruit'),
];
//Lesson list builder
Widget lessons() {
  return Center(
    child: Container(
      padding: EdgeInsets.only(left: 15),
      height: 135,
      width: 400,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            Item course = items[index];
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        child: Ink.image(
                          child: Text(""),
                          image: AssetImage(course.image),
                          height: 102,
                          width: 157,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(course.name)
              ],
            );
          }),
    ),
  );
}

//All Subject Options
Widget options(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Maths',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/Calculator.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'English',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/report.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Science',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/Atom.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hindi',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/Book.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Social\nScience',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/hat.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driveloader(),
                ),
              );
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: ["#60bcfa".toColor(), "#60bcfa".toColor()],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 63,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Others',
                          style: TextStyle(fontSize: 16),
                        ),
                        Image.asset(
                          'images/hat.png',
                          width: 60,
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget quiz() {
  return Row(
    children: [
      Expanded(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            height: 100,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: ["#44a0de".toColor(), "#44a0de".toColor()],
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("images/quize.png"),
                  Spacer(),
                  Image.asset("images/quiz arrow.png")
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget book() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Ink.image(
                    image: AssetImage("images/kids.png"),
                    height: 170,
                    width: 325,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              Container(
                width: 180,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Center(
                  child: Text(
                    "Book Online",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class classinfo extends StatefulWidget {
  const classinfo({super.key});

  @override
  State<classinfo> createState() => _classinfoState();
}

class _classinfoState extends State<classinfo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, top: 20, bottom: 15, right: 20),
              child: Row(
                children: [
                  Text(
                    "All Subjects",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
            options(context),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => quizpage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, right: 10, bottom: 0),
                child: quiz(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 20, bottom: 15, right: 20),
              child: Row(
                children: [
                  Text(
                    "Session Booking",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
            book(),
            Container(
              margin: EdgeInsets.only(left: 25, top: 20, bottom: 15, right: 20),
              child: Row(
                children: [
                  Text(
                    "Video Lectures",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClassChoose(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
            lessons(),
          ],
        ),
      ],
    );
  }
}
