import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyTextFeild extends StatefulWidget {
  final String lb;
  final bool obscureText;
  final controller;
  final prefixIcon;
  final validate;
  final onChange;
  const MyTextFeild(
      {super.key,
        required this.lb,
        required this.obscureText,
        required this.controller,
        this.prefixIcon, this.validate, this.onChange});

  @override
  State<MyTextFeild> createState() => _MyTextFeildState();
}

class _MyTextFeildState extends State<MyTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: widget.lb,
        prefixIcon: widget.prefixIcon,
        labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[400],
            fontWeight: FontWeight.bold),
      ),
      obscureText: widget.obscureText,
      validator: widget.validate,
      onChanged: widget.onChange,
    );
  }
}