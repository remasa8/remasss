import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WedgitScreen extends StatelessWidget {

  String label;
  Icon icon;
  TextEditingController controller;
  TextInputType textInputType;
  bool obscure;
  WedgitScreen({required this.textInputType , required this.controller , required this.icon ,  this.obscure = false , required this.label});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscure,
      validator: (value){
        if(value == null || value.isEmpty)
        {
          return "Eroor in $label";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)
          )
      ),
    );
  }
}
