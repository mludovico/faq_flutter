import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faq_flutter/model/qa_pair.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc {

  static final QuestionBloc _questionBloc = QuestionBloc._internal();
  static QuestionBloc get getInstance => _questionBloc;

  final _controller = BehaviorSubject<List<QAPair>>();
  Stream<List<QAPair>> get outValues => _controller.stream;
  List<QAPair> qaList = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription sub;

  QuestionBloc._internal() {
    sub = _firestore.collection('questions').snapshots().listen((event) {
      qaList.clear();
      for (var doc in event?.docs) {
        qaList.add(QAPair.fromMap(doc?.data()));
      }
      _controller.add(qaList);
    });
  }

  Future<bool> addQuestion(QAPair question) async {
    DocumentReference doc = await _firestore.collection('questions').add(question.toMap());
    if (doc != null) {
      print('Successfully added question');
      return true;
    } else {
      print('Failed to add question');
      return false;
    }
  }

  close() {
    sub.cancel();
    _controller.close();
  }
}