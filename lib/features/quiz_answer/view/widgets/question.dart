import 'package:flutter/material.dart';


Widget widgetQuestion(String question, {double myWidht=200.0, double myHeight=100.0}) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    margin: EdgeInsets.only(top: 80.0),
    width: myWidht,
    height: myHeight-5,
    alignment: Alignment.center,
    decoration: BoxDecoration(
            color: const Color.fromARGB(255, 223, 241, 250),
            borderRadius: BorderRadius.circular(10),
    ),
    child: Text(question, 
                style: TextStyle(fontSize: 16),
          ),
  );
}