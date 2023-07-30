import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aithinkism/subject_selector.dart';

class ClassChoose extends StatefulWidget {
  const ClassChoose({super.key});

  @override
  State<ClassChoose> createState() => _ClassChooseState();
}

class _ClassChooseState extends State<ClassChoose> {
  final _images = [
    Image.asset("images/c1.png"),
    Image.asset("images/c2.png"),
    Image.asset("images/c3.png"),
    Image.asset("images/c4.png"),
    Image.asset("images/c5.png"),
    Image.asset("images/c6.png"),
    Image.asset("images/c7.png"),
    Image.asset("images/c8.png"),
    Image.asset("images/c9.png"),
    Image.asset("images/c10.png"),
    Image.asset("images/c11.png"),
    Image.asset("images/c12.png"),
  ];

  List classes = [];
  List subjects = [];

  final String _url =
      "https://script.googleusercontent.com/macros/echo?user_content_key=zUeiZ4t0hbot3SUfkjpPZcBKleWd-dlkJF6anQ8lKkQq5nv53uSBPvztGPDJmVGuFqA0RXFMTtSDLRKXjDBRAEJMBsTHqLiCm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnOkjmmNq0qwI8d-R44pvL0mryzOV9kIPLqXJDT131nf1NIKbSN0XhIdmzsRP-ngMohib6J4MqMEH1SDI7bbw-MO3ThJ2CHkl1Nz9Jw9Md8uu&lib=MiwZI_C7SdcdOZbzuwZolV07pPMnr1eZL";

  Future<void> getClassData() async {
    http.Response response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      for (var element in body) {
        classes.add(element['class']);
        subjects.add(element['subjects']);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getClassData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Select Class",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (classes.length != _images.length)
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 20,
                      spacing: 20,
                      children: List.generate(
                        classes.length,
                        (index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectSelector(
                                subjects: subjects[index],
                              ),
                            ),
                          ),
                          child: classBox(
                            _images[index],
                            classes[index],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Container classBox(Image image, String classData) {
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
        color: Color(0xFFbfe8ff),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          image,
          Text(classData),
          const Spacer(),
        ],
      ),
    );
  }
}
