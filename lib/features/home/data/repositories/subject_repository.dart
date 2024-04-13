import 'package:app_quiz/core/data/repositories/external_api.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'dart:convert';


class SubjectRepository {

    List<Subject>? getAllSubjects(String token) {
      
      String url = "http://localhost:8080/api/v1/subjects";
      List<Subject> listSubjects = [];
      
      try {
        ExternalApi().execute(token, url).then((result) {
      
          if (result.containsKey('result')) {
            if (result['result'] != null) {
              var list = jsonDecode(result['result']);
              for(var item in list){
                Subject subject = Subject(); 
                subject.fromJson(item);
                listSubjects.add(subject);
              }
              return  listSubjects;
            }
          } else if (result.containsKey('error')) {
            if (result['error'] != null) {
              throw Exception('Failed to list the Subjects: ${result['error']}');
            }
          }
        });

      } catch (e) {
        throw Exception('Failed to list the Subjects.');
      }
  }

}