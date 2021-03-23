import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/screens/add_question_screen.dart';
import 'package:faq_flutter/widgets/add_button.dart';
import 'package:faq_flutter/widgets/question_tile.dart';
import 'package:faq_flutter/widgets/snack_contents.dart';
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
            AddButton(
              onPressed: () async  {
                var success = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddQuestionScreen(),
                  ),
                );
                if (success != null) {
                  SnackBar snack = SnackBar(
                    padding: EdgeInsets.all(3),
                    backgroundColor: GREEN,
                    content: SnackContents(success: success,),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
