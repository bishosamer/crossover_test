class Option {
  final String id;
  final String answer;

  Option({required this.id, required this.answer});
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(id: json['id'], answer: json['answer']);
  }
}
