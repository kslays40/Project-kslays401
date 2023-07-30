import 'package:flutter/material.dart';
import 'nameage.dart';

class skiplogin extends StatefulWidget {
  const skiplogin({super.key});

  @override
  State<skiplogin> createState() => _skiploginState();
}

class _skiploginState extends State<skiplogin> {
  bool maleSelected = false;
  bool femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 50),
                bottomRight: Radius.elliptical(200, 50),
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'What\'s your gender?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    maleSelected = true;
                    femaleSelected = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Opacity(
                      opacity: maleSelected ? 1.0 : 0.5,
                      child: Image.asset(
                        'images/male.png',
                        width: MediaQuery.of(context).size.height * 0.15,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    femaleSelected = true;
                    maleSelected = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Opacity(
                      opacity: femaleSelected ? 1.0 : 0.5,
                      child: Image.asset(
                        'images/female.png',
                        width: MediaQuery.of(context).size.height * 0.15,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
          FilledButton(
            onPressed: maleSelected || femaleSelected
                ? () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => NameAgeScreen(
                     selectedImage: maleSelected
                         ? 'images/male.png'
                         : 'images/female.png',
                   ),
                 ),
               );
            }
                : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(72, 189, 255, 1),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(4),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * 0.5, 0),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
