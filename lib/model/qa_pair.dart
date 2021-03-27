class QAPair {
  String question;
  String answer;
  int colorIndex;

  QAPair({this.question, this.answer, this.colorIndex});

  factory QAPair.fromMap(Map json) => QAPair(
    question: json['question'] ?? '',
    answer: json['answer'] ?? '',
    colorIndex: json['color'] ?? 0,
  );

  Map<String, dynamic> toMap() => {
    'question': question ?? '',
    'answer': answer ?? '',
    'color': colorIndex ?? 0,
  };
}