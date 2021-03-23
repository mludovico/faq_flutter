import 'package:faq_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  final void Function() onPressed;
  AddButton({this.onPressed});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => YELLOW),
          padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10)),
          elevation: MaterialStateProperty.resolveWith((states) => 0)
      ),
      onPressed: onPressed,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                'Adicionar Pergunta',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: BLUE,
                    fontWeight: FontWeight.w800,
                    fontSize: 15
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: -8,
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: BLUE
              ),
            ),
          ),
        ],
      ),
    );
  }

}
