import 'package:faq_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnMessage extends StatefulWidget {

  final bool success;
  ReturnMessage({this.success});

  @override
  _ReturnMessageState createState() => _ReturnMessageState();
}

class _ReturnMessageState extends State<ReturnMessage> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: GREEN,
      content: Stack(
        children: [
          Icon(CupertinoIcons.check_mark_circled_solid),
          Text(widget.success ? 'Pergunta adicionada com sucesso' : 'Falha ao adicionar a pergunta'),
        ],
      ),
    );
  }
}
