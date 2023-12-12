import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/view/widgets/button_page_option.dart';

Widget optionSubject(BuildContext context) {
  List<String> listSubjects = [
    'Celebrities',
    'Movies',
    'News',
    'History',
    'Songs',
    'Science',
    'Technology',
    'Social Midias',
    'Car'
  ];
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
