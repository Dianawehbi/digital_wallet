import 'package:flutter/material.dart';

// i leave this for latter

class MyTextField extends StatefulWidget {
  final TextInputType keyboardtype;
  final String hint;
  final double height;
  final double width;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.controller ,
      this.keyboardtype = TextInputType.text,
      this.hint = "",
      this.height = 50,
      this.width = 100});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        style: TextStyle(fontSize: 14 , fontStyle: FontStyle.italic,),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.hint,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardtype,
      ),
    );
  }
}
