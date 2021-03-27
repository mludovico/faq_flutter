import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faq_flutter/model/qa_pair.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc {

  static final QuestionBloc _questionBloc = QuestionBloc._internal();
  static QuestionBloc get getInstance => _questionBloc;

  final _questionsController = BehaviorSubject<List<QAPair>>();
  final _loadingController = BehaviorSubject<bool>();
  Stream<List<QAPair>> get outValues => _questionsController.stream;
  Stream<bool> get outLoading => _loadingController.stream;
  List<QAPair> qaList = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription sub;

  QuestionBloc._internal() {
    _loadingController.add(false);
    sub = _firestore.collection('questions').snapshots().listen((event) {
      qaList.clear();
      for (var doc in event?.docs) {
        qaList.add(QAPair.fromMap(doc?.data()));
      }
      _questionsController.add(qaList);
    });
  }

  Future<bool> addQuestion(QAPair question) async {
    _loadingController.add(true);
    DocumentReference doc = await _firestore.collection('questions').add(question.toMap());
    if (doc != null) {
      print('Successfully added question');
      _loadingController.add(false);
      return true;
    } else {
      print('Failed to add question');
      _loadingController.add(false);
      return false;
    }
  }

  close() {
    sub.cancel();
    _questionsController.close();
  }
}