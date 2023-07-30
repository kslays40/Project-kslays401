import 'package:flutter/material.dart';
import 'package:aithinkism/videoplayer.dart';
import 'package:flutter/services.dart';

class VideoUI extends StatefulWidget {
  final String subject;
  final List chapters;
  const VideoUI({
    Key? key,
    required this.subject,
    required this.chapters,
  }) : super(key: key);

  @override
  State<VideoUI> createState() => _VideoUIState();
}

class _VideoUIState extends State<VideoUI> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: const AssetImage("images/c1.png"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.darken))),
                width: double.infinity,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 40,
                      right: 40,
                      child: Image.asset(
                        "images/c2.png",
                        width: 90,
                        height: 90,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: Text(
                        widget.subject,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.chapters.length} Chapters",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 48, 48)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Video",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayer(
                                  chapters: widget.chapters,
                                  current: 0,
                                  subject: widget.subject,
                                )),
                          ).then((value) => setState(() {SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ]);}));
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 17,
                            ),
                            const Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    widget.chapters[0][' Name'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Chapters",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Expanded(
                        child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: widget.chapters.length - 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayer(
                                          chapters: widget.chapters,
                                          current: index+1,
                                          subject: widget.subject,
                                        )),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 234, 233, 233),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: double.infinity,
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 17,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage("images/c9.png"))),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          widget.chapters[index + 1][" Name"],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
