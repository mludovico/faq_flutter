import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/widgets/add_button.dart';
import 'package:faq_flutter/widgets/question_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perguntas Frequentes',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuestionTile(
                      color: GREEN,
                      question: 'Qustion?',
                      answer: 'Lorem ipsum dolor sit smet, consectetur adipiscing slit, sed do eiusmod tempor incidunt'
                    ),
                  ],
                ),
              ),
            ),
            AddButton(),
          ],
        ),
      ),
    );
  }
}
