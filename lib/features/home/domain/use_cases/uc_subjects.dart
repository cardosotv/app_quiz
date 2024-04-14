import 'package:app_quiz/features/home/data/models/models_subjects.dart';
import 'package:app_quiz/features/home/data/repositories/subject_repository.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'dart:convert';

class UseCasesSubjects {
  UseCasesSubjects();

  List<Subject> getAllSubjects(var json) {
  
    List<Subject> listSubjects = [];
  
    try {
      if (json.containsKey('result')) {
        if (json['result'] != null) {
          var list = jsonDecode(json['result']);
          for (var item in list) {
            Subject subject = Subject();
            subject.fromJson(item);
            listSubjects.add(subject);
          }
          return listSubjects;
        }
      } else if (json.containsKey('error')) {
        if (json['error'] != null) {
          throw Exception('Failed to list the Subjects: ${json['error']}');
        }
      }
    } catch (e) {
      throw Exception('Failed to list the Subjects.');
    }
    return listSubjects;
  }
}