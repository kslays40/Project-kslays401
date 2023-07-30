import 'package:flutter/material.dart';

class MentorScreen extends StatefulWidget {
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  IconData favmentorIcon = Icons.favorite_border;
  bool isTapped = false;

  void handleTap() {
    setState(
      () {
        isTapped = !isTapped;
        favmentorIcon = isTapped ? Icons.favorite : Icons.favorite_border;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/mentor.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 20,
                              blurRadius: 100,
                              offset: const Offset(0, -3),
                            ),
                          ],
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Adarsh Kumar',
                                style: TextStyle(
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Meditation',
                                style: TextStyle(
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 2,
                        width: 100,
                        color: const Color.fromRGBO(96, 188, 250, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'In the stillness of meditation, embrace the present moment, letting go of worries and distractions. Breathe deeply, finding tranquility within. Discover the wisdom and peace hidden in the depths of your soul, as you journey towards self-awareness and harmony, guided by the gentle rhythm of your breath.'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 95,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "4.8  ",
                                  style: TextStyle(
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(87, 87, 87, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "1000 reviews",
                                  style: TextStyle(
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 95,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "3 hrs ",
                                  style: TextStyle(
                                    color: Color.fromRGBO(87, 87, 87, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.access_time_filled_sharp,
                                  color: Color.fromRGBO(87, 87, 87, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: const Color.fromRGBO(96, 188, 250, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(96, 188, 250, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Register trial lesson',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              handleTap();
                            },
                            child: Icon(
                              favmentorIcon,
                              color: const Color.fromRGBO(96, 188, 250, 1),
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Course details',
                        style: TextStyle(
                            color: Color.fromRGBO(87, 87, 87, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'In the stillness of meditation, embrace the present moment, letting go of worries and distractions. Breathe deeply, finding tranquility within. Discover the wisdom and peace hidden in the depths of your soul, as you journey towards self-awareness and harmony, guided by the gentle rhythm of your breath.'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
