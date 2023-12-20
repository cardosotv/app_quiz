import 'package:app_quiz/features/home/data/models/models_subjects.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';


class UseCasesSubjects {

  UseCasesSubjects();

  List<Subject> getAllSubjects(){
    return SubjectModal().getAll();
  }

  List<String> getAllSubjectsNames(){
    var list = getAllSubjects();
    List<String> result = [];
    for (var item in list) {
      result.add(item.subject);
    }
    return result;
  }
}