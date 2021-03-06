import 'package:faq_flutter/bloc/questions_bloc.dart';
import 'package:faq_flutter/constants/colors.dart';
import 'package:faq_flutter/model/qa_pair.dart';
import 'package:faq_flutter/widgets/color_picker.dart';
import 'package:faq_flutter/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {

  final QuestionBloc _bloc = QuestionBloc.getInstance;
  int selected = 0;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Título da pergunta',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                        ),
                      ),
                      controller: _questionController,
                      validator: validateFields,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Resposta da pergunta',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            gapPadding: 5),
                      ),
                      controller: _answerController,
                      validator: validateFields,
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
                    child: ColorPicker(selected: selected, onTap: setCurrentColor),
                  ),
                  ],
                ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: StreamBuilder<bool>(
                  stream: _bloc.outLoading,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(YELLOW),
                        shape: MaterialStateProperty.all(ContinuousRectangleBorder()),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 10)
                        )
                      ),
                      onPressed: snapshot.hasData && !snapshot.data ? addQA : null,
                      child: snapshot.hasData && !snapshot.data
                        ?
                      Text(
                        'Adicionar',
                        style: TextStyle(
                          fontSize: 15,
                          color: BLUE,
                          fontWeight: FontWeight.bold),
                      )
                        :
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(BLUE),
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
    );
  }

  setCurrentColor(int colorIndex) {
    setState(() {
      selected = colorIndex;
    });
  }

  String validateFields(String text) {
    if (text == null || text.isEmpty) {
      return 'Você deve preencher um valor válido';
    } else {
      return null;
    }
  }

  addQA() async {
    bool valid = formKey.currentState.validate();
    print(valid);
    if (!valid) return;
    var result = await _bloc.addQuestion(
      QAPair(
        question: _questionController.text,
        answer: _answerController.text,
        colorIndex: selected,
      )
    );
    if(result) Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      MySnackBar.makeSnackBar(success: result),
    );
  }
}
