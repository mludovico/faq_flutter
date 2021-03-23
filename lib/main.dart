import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/screens/questions_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: BLUE,
        primaryColor: BLUE,
      ),
      home: QuestionsScreen()
    );
  }
}