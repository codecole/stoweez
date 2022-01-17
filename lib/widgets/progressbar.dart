import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StoryProgressBar extends StatelessWidget {
  StoryProgressBar({required this.percentValue,Key? key}) : super(key: key);

  List<double> percentValue = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 40.0, left: 8, right: 8),
        child: Row(
          children: [
            Expanded(
                child: RProgressBar(
              percentValue: percentValue[0],
            )),
            Expanded(child: RProgressBar(percentValue: percentValue[1])),
            Expanded(child: RProgressBar(percentValue: percentValue[2]))
          ],
        ),
      ),
    );
  }
}

class RProgressBar extends StatelessWidget {
  double percentValue = 0.1;

  RProgressBar({required this.percentValue});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 15,
      percent: percentValue,
      progressColor: Colors.grey,
      backgroundColor: Colors.black,
    );
  }
}
