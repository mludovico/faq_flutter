import 'package:faq_flutter/bloc/questions_bloc.dart';
import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/model/qa_pair.dart';
import 'package:faq_flutter/widgets/color_picker.dart';
import 'package:flutter/material.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {

  final QuestionBloc _bloc = QuestionBloc.getInstance;
  final colors = [GREEN, RED, YELLOW, BLUE];
  Color selected = GREEN;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicionar pergunta',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Título da pergunta',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        gapPadding: 5,
                      ),
                    ),
                    controller: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Resposta da pergunta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5),
                    ),
                    minLines: 4,
                    maxLines: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Cor',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ColorPicker(colors: colors, selected: selected),
                ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(YELLOW),
                    shape: MaterialStateProperty.all(ContinuousRectangleBorder()),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 10)
                    )
                  ),
                  onPressed: () => addQA(),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(
                        fontSize: 15, color: BLUE, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  addQA() {
    var result = _bloc.addQuestion(QAPair(
      question: _questionController.text,
      answer: _answerController.text,
    ));
    if()
  }
}
