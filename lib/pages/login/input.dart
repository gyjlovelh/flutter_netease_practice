import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  Input({
    @required this.controller,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: TextField(
        controller: controller,
        autofocus: false,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black12,
            fontSize: 18.0
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            prefixIcon, 
            size: 20.0,
            // color: Colors.black26
          )
        ),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18.0
        ),
        obscureText: obscureText
      ),
    );
  }
}