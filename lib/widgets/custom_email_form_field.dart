import 'package:flutter/material.dart';

class CustomEmailFormField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final TextInputType? keyboardType;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomEmailFormField({
    super.key,
    this.hintText,
    this.helperText,
    this.labelText,
    this.keyboardType,
    required this.formProperty,
    required this.formValues,
  });

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

        if (value.length < 3) {
          return 'Mínimo 3 caracteres';
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
