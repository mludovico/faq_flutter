class QAPair {
  String question;
  String answer;
  QAPair({this.question, this.answer});

  factory QAPair.fromMap(Map json) => QAPair(
    question: json['question'] ?? '',
    answer : json['answer'] ?? '',
  );

  Map toMap() => {
    'question': question ?? '',
    'answer': answer ?? '',
  };
}