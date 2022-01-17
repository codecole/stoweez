import 'package:flutter/material.dart';

class StoryA extends StatelessWidget {
  const StoryA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
    );
  }
}

class StoryB extends StatelessWidget {
  const StoryB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}

class StoryC extends StatelessWidget {
  const StoryC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
    );
  }
}
