import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable{

  String? _id;
  String? _startedDate;
  int? _score;  
  List<Question>? _questions;
  
  Game();

  String? get id => _id;
  String? get startedDate => _startedDate;
  int? get score => _score;
  List<Question>? get questions => _questions;

  @override // TODO: implement props
  List<Object?> get props => [_id, _startedDate, _score, _questions];

}