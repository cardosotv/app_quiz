import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/quiz.dart';
import 'package:app_quiz/core/domain/use_cases/utils.dart';

Widget buttonPageOption (String option, BuildContext context, { double myWidth = 100, double myHeight = 100 }){
  return GestureDetector(
    onTap: () {
      print("The user pressioned the option $option");
      Navigator.pushNamed(context, '/quiz', arguments: Quiz(id: 8, name:option, about:"About123"));
      resetGlobarVar();
    },
    child: Container(
      padding: const EdgeInsets.all(8.0),
      width: myWidth,
      height: myHeight,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color.fromARGB(255, 219, 240, 250),),
        borderRadius: BorderRadius.circular(10),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon( 
            Icons.person_2,
            color: Colors.blue,
            size: 36,
            ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Text(
              option,
              style: const TextStyle(fontSize: 12, color: Color.fromARGB(137, 10, 9, 9)),
            ),
          ),
        ],
      ),
    ), 
  );
}