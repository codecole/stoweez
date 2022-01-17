import 'package:flutter/material.dart';
import 'package:stoweez/screen/story_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadStory() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StoryView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' S T O W E E Z'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return StoryCircle(
                      onPressed: _loadStory,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class StoryCircle extends StatelessWidget {
  final Function()? onPressed;

  StoryCircle({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
