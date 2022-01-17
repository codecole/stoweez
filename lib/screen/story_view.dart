// ignore_for_file: empty_statements

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoweez/screen/stories.dart';
import 'package:stoweez/widgets/progressbar.dart';

class StoryView extends StatefulWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  int currentStoryIndex = 0;

  final List<Widget> stories = [
    StoryA(),
    StoryB(),
    StoryC(),
  ];

  List<double> percentValue = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < stories.length; i++) {
      percentValue.add(0);
    }

    _watchStories();
  }

  void _watchStories() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (percentValue[currentStoryIndex] + 0.01 < 1) {
          percentValue[currentStoryIndex] += 0.01;
        } else {
          percentValue[currentStoryIndex] = 1;
          timer.cancel();

          if (currentStoryIndex < stories.length - 1) {
            currentStoryIndex++;

            _watchStories();
          } else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 2) {
      setState(() {
        if (currentStoryIndex > 0) {
          percentValue[currentStoryIndex - 1] = 0;
          percentValue[currentStoryIndex] = 0;

          currentStoryIndex--;
        }
      });
    } else {
      setState(() {
        if (currentStoryIndex < stories.length - 1) {
          percentValue[currentStoryIndex] = 1;
          currentStoryIndex++;
        } else {
          percentValue[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            stories[currentStoryIndex],
            StoryProgressBar(
              percentValue: percentValue,
            )
          ],
        ),
      ),
    );
  }
}
