import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/core/domain/models/user.dart';

Widget userScore(String title, User user, {double myWidht = 200, double  myHeight = 150}) {
  return Container(
    width: myWidht,
    height: myHeight-5,
    alignment: Alignment.centerLeft,
    
    decoration: const BoxDecoration(
     // color: Color.fromARGB(255, 223, 241, 250),
    //                           border: Border.all(width: 2, color: Colors.grey),
    //                           borderRadius: BorderRadius.circular(10),
                ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title, 
            style: const TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 24),
          ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              "${loggedUser.score} pts",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
