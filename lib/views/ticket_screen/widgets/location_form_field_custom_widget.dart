import 'package:flutter/material.dart';

class LocationFormFieldCustomWidget extends StatelessWidget {
  const LocationFormFieldCustomWidget({
    super.key,
    required this.labelTitle,
    this.onChanged,
  });

  final String labelTitle;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: TextFormField(
        cursorColor: Colors.white,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          label: Text(labelTitle),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}