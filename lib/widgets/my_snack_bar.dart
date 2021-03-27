import 'package:faq_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySnackBar extends SnackBar {

  static SnackBar makeSnackBar({bool success}) {
    return SnackBar(
      padding: EdgeInsets.all(3),
      backgroundColor: success ? GREEN : RED,
      content: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 16,
            child: Icon(
              success ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.clear_circled_solid,
              color: Colors.white,
            ),
          ),
          Text(
            success ? 'Pergunta adicionada com sucesso' : 'Falha ao adicionar a pergunta',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}