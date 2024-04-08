import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextFormField(TextEditingController controller, String text, IconData iconData, bool isHide){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isHide,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      ),
    );
  }
}