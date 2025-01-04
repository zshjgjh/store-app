import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField ({this.hintText,this.onChanged,this.inputType});
  String? hintText;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType:inputType ,
      onChanged:onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Colors.white,

          ),
        ) ,

      ),
    );
  }
}