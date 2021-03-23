import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {

  final String question, answer;
  final Color color;
  QuestionTile({this.color, this.question, this.answer});

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      elevation: 15,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(left: 2),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              expanded = value;
            });
          },
          title: Text(
            widget.question,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black
            ),
          ),
          trailing: Icon(
            expanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
            color: Colors.grey[700],
          ),
          childrenPadding:EdgeInsets.only(
              left: 16,
              right: 8,
              bottom: 24
          ),
          children: [
            Text(
              widget.answer,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13
              ),
            ),
          ],
        ),
      ),
    );
  }
}
