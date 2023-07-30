import 'package:aithinkism/googlenewsloader.dart';
import 'package:aithinkism/mentor_screen.dart';
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

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool showContainer = false;
  bool showSubtitle = false;

  void toggleContainer() {
    setState(() {
      showContainer = !showContainer;
    });
  }

  void toggleSubtitle() {
    setState(() {
      showSubtitle = !showSubtitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: toggleContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/main_logo.png',
                width: 250,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
          child: Row(
            children: [
              const Text(
                "Food Drives",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
        ), //Food drive(FD)
        SizedBox(
          height: 290,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(
                    width: 280,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                child: Ink.image(
                                  image: const AssetImage("images/Img1.png"),
                                  height: 170,
                                  width: 230,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text("Title"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              }),
        ), //FD builder

        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
          child: Row(
            children: [
              const Text(
                "Popular Mentor",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
        ), //Mentors
        SizedBox(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                child: Ink.image(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MentorScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(""),
                                  ),
                                  image: AssetImage("images/mentor.png"),
                                  height: 170,
                                  width: 230,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text("Mentors"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              }),
        ),

        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
          child: Row(
            children: [
              const Text(
                "Daily News",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
        ), //News
        SizedBox(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                child: Ink.image(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => googlenewsloader(),
                                        ),
                                      );
                                    },
                                    child: Text(""),
                                  ),
                                  image: AssetImage("images/Googlenews.png"),
                                  height: 170,
                                  width: 230,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text("G-News"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              }),
        ), //news builder
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
          child: Row(
            children: [
              const Text(
                "Blogs",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Ink.image(
                    image: AssetImage(
                      "images/$index.png",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
