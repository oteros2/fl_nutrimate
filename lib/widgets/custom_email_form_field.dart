import 'package:NutriMate/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomEmailFormField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final TextInputType? keyboardType;
  final String formProperty;
  final Map<String, String> formValues;
  final FocusNode? focusNode;

  const CustomEmailFormField(
      {super.key,
      this.hintText,
      this.helperText,
      this.labelText,
      this.keyboardType,
      required this.formProperty,
      required this.formValues,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }

        if (formProperty == 'email' && !value.contains('@')) {
          return 'Por favor, ingresa un email válido';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
      ),
    );
  }
}
