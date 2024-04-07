import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:app_quiz/features/home/domain/use_cases/uc_subjects.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/presentation/widgets/button_page_option.dart';

Widget optionSubject(BuildContext context) {
  
  List<Subject> listSubjects = UseCasesSubjects().getAllSubjects();

  return GridView.count(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    crossAxisCount: 3,
    children: List.generate(listSubjects.length , (index) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: buttonPageOption(listSubjects[index], context),
      );
    }),
  );
}
