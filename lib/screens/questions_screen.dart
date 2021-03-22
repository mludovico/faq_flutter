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
        title: Text('Perguntas Frequentes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('Qustion?'),
                children: [
                  Text('Answer!'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
