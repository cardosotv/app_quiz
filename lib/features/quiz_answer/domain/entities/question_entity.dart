import "package:equatable/equatable.dart";

class Question extends Equatable {
  String? _id;
  String? _question;
  List<String>? _options;
  String? _correctAnswer;

  String? get id => _id;
  String? get question => _question;
  List<String>? get options => _options;
  String? get correctAnswer => _correctAnswer;

  Question();

  @override
  List<Object?> get props => [id, question, options, correctAnswer];

  void fromJson(Map<String?, dynamic> decodedQuestion){

    _options = [];
    for(var item in decodedQuestion['options']){
      _options!.add(item['option'].toString());
      if(item['isCorrect'] == true){
        _correctAnswer = item['option'].toString();
      }
    }
    _id = decodedQuestion['id'];
    _question = decodedQuestion['question'];
  }
}
