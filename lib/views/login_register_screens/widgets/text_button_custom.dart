import 'package:final_project/constants/routs_constants.dart';
import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({required this.textButton, super.key});

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, registerScreen);
      },
      child: Text(textButton, style: TextStyle(color: Colors.blue)),
    );
  }
}
