import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'usuario': 'usuario',
      'contraseña': 'contraseña'
    };

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: myFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      hintText: 'Usuario',
                      labelText: 'Usuario',
                      obscureText: false,
                      formProperty: 'usuario',
                      formValues: formValues),
                  CustomTextFormField(
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      obscureText: true,
                      formProperty: 'contraseña',
                      formValues: formValues)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
