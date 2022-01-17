import 'package:flutter/material.dart';
import 'package:stoweez/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stoweez',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
