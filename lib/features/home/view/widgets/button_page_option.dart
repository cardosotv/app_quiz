import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/core/domain/use_cases/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget buttonPageOption (Subject option, BuildContext context, { double myWidth = 100, double myHeight = 100 }){
  print(option.icon);
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
          // decoration: BoxDecoration(
          //   border: Border.all(width: 1, color: const Color.fromARGB(255, 219, 240, 250),),
          //   borderRadius: BorderRadius.circular(10),
          //   ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon( 
                IconData(option.icon, fontFamily: 'MaterialIcons'),
                //option.subject == "Science" ? Icons.science : Icons.person_2,
                color: Colors.blue,
                size: 36,
                ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text(
                  option.subject,
                  style: const TextStyle(fontSize: 12, color: Color.fromARGB(137, 10, 9, 9)),
                ),
              ),
            ],
        ),
      ),
    ), 
  );
}