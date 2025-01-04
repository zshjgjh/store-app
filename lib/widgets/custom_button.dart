

import 'package:flutter/material.dart';
import 'package:store/helper/api.dart';
import 'package:store/services/update_product_service.dart';

class CustomButton extends StatelessWidget {
  CustomButton({ required this.text,this.onTap}) ;
  final String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 50,
        child:  Center(
          child: Text(text,
            style:  const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),),
        ),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
