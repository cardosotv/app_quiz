import 'package:app_quiz/features/home/data/repositories/repository_subjects.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';

class SubjectModal extends Subject {

  List<Subject> getAll(){
    var list = subjectsDB;
    List<Subject> listSubjects = [];
    for (var item in list) {
      listSubjects.add(Subject(
        id: item['id'],
        subject: item['subject'],
        about: item['about'],
      ));
    }
  return listSubjects;
  }
}
