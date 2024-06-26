import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/core/domain/use_cases/utils.dart';

Widget buttonPageOption (Subject option, BuildContext context, { double myWidth = 100, double myHeight = 100 }){
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/quiz', arguments: option);
      resetGlobarVar();
    },
    child: Card(
      elevation: 1,
      //color: Color.fromARGB(255, 239, 250, 252),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: myWidth,
          height: myHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon( 
                IconData(0xe7fd, fontFamily: 'MaterialIcons'),
                color: Colors.blue,
                size: 36,
                ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text(
                  option.subject,
                  style: const TextStyle(fontSize: 12, 
                                  color: Color.fromARGB(137, 10, 9, 9),
                                  fontWeight: FontWeight.bold
                              ),
                ),
              ),
            ],
        ),
      ),
    ), 
  );
}