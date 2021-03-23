import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackContents extends StatelessWidget {

  final bool success;
  SnackContents({this.success});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 16,
          child: Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Colors.white,
          ),
        ),
        Text(
          success ? 'Pergunta adicionada com sucesso' : 'Falha ao adicionar a pergunta',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

