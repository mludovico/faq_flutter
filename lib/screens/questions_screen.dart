import 'package:faq_flutter/bloc/questions_bloc.dart';
import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/model/qa_pair.dart';
import 'package:faq_flutter/screens/add_question_screen.dart';
import 'package:faq_flutter/widgets/add_button.dart';
import 'package:faq_flutter/widgets/question_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  final QuestionBloc _bloc = QuestionBloc.getInstance;

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
                child: StreamBuilder<List<QAPair>>(
                  stream: _bloc.outValues,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data.isEmpty) {
                      return Center(
                        child: Text('Nenhuma pergunta por aqui'),
                      );
                    }
                    return Column(
                      children: snapshot.data.map<Widget>((question) => 
                        QuestionTile(
                          color: COLORS[question.colorIndex],
                          question: question.question,
                          answer: question.answer,
                        ),
                      ).toList(),
                    );
                  }
                ),
              ),
            ),
            AddButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddQuestionScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
