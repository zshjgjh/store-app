import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {

  CustomTextFormField ({this.hintText,this.onChanged,this.inputType});
  String? hintText;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return 'field is required';

        }
      },
      keyboardType:inputType ,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(

              color: Colors.white
          ),
        ) ,

      ),
    );
  }
}