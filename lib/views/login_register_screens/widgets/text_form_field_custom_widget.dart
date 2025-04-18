import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({required this.labelTitle,required this.onChanged,super.key});
 final String labelTitle;
 final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          label: Text(labelTitle),
        ),

      ),
    );
  }
}