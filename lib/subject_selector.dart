import 'package:flutter/material.dart';
import 'package:aithinkism/vedioui.dart';

class SubjectSelector extends StatefulWidget {
  final List subjects;
  const SubjectSelector({
    Key? key,
    required this.subjects,
  }) : super(key: key);

  @override
  State<SubjectSelector> createState() => _ClassChooseState();
}

class _ClassChooseState extends State<SubjectSelector> {
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
                  "Select Subject",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (widget.subjects.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 20,
                      spacing: 20,
                      children: List.generate(
                        widget.subjects.length,
                        (index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoUI(
                                subject: widget.subjects[index]['subject'],
                                chapters: widget.subjects[index]['chapters'],
                              ),
                            ),
                          ),
                          child: classBox(
                            widget.subjects[index]['subject'],
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
}

Container classBox(String subject) {
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subject),
        ),
        const Spacer(),
      ],
    ),
  );
}
