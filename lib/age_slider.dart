import 'package:flutter/material.dart';

class AgeSlider extends StatefulWidget {
  final int defaultValue;

  const AgeSlider({this.defaultValue = 10, Key? key}) : super(key: key);

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  int _currentAge = 10;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _currentAge = widget.defaultValue;
    _scrollController = ScrollController(
      initialScrollOffset: 40 * (widget.defaultValue - 1).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromRGBO(87, 87, 87, 0.17),
            width: 1,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemCount: 60,
          itemBuilder: (context, index) {
            final number = index + 1;
            final isSelected = number == _currentAge;

            BoxDecoration decoration;
            Widget child;
            if (isSelected) {
              decoration = const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(72, 189, 255, 1),
              );
              child = Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              decoration = const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              );
              child = Text(
                '$number',
                style: const TextStyle(
                  color: Color.fromRGBO(87, 87, 87, 0.17),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentAge = number;
                  });
                },
                child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  decoration: decoration,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}