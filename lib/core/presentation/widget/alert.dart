
import 'package:flutter/material.dart';

SnackBar snackBarCustom(context, String message) {
  return SnackBar(
    content: Text(message, style: const TextStyle(fontSize: 20), 
      textAlign: TextAlign.center,),
    backgroundColor: Colors.redAccent,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 300,
      left: 10,
      right: 10,
    ),
  );
}