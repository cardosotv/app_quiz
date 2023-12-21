import 'package:app_quiz/features/quiz_answer/data/repositories/quiz.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

class SubjectModal extends Subject {

  List<Subject> getAll(){
    var list = repositorieQuiz;
    List<Subject> listSubjects = [];
    for (var item in list) {
      listSubjects.add(Subject(
        id: item['id'],
        subject: item['subject'],
        about: item['about'],
        icon: item['icon'],
      ));
    }
  return listSubjects;
  }
}
