import 'package:flutter/material.dart';

void snackBar(BuildContext context,String message,Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
  backgroundColor: color,
  elevation: 2,));
}



