class YesNoModel {
  final String answer;
  final String image;
  final bool forced;

  YesNoModel({ required this.answer, required this.forced, required this.image });
  
  factory YesNoModel.fromMap(Map<String, dynamic> map) {
    return YesNoModel(
      answer: map["answer"],
      forced: map["forced"],
      image: map["image"]
    );
  }
}