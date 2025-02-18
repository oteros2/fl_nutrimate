import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

import 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'usuario': 'usuario',
      'contraseña': 'contraseña'
    };
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: screenWidth / 1.5,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  width: screenWidth / 1.2,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: 'Usuario',
                        labelText: 'Usuario',
                        obscureText: false,
                        formProperty: 'usuario',
                        formValues: formValues,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        hintText: 'Contraseña',
                        labelText: 'Contraseña',
                        obscureText: true,
                        formProperty: 'contraseña',
                        formValues: formValues,
                      ),
                    ],
                  ),
                ),
              ],
            )),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                child: const Text('Acceder'),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 5),
            const Divider(),
            SizedBox(
              width: screenWidth / 1.2,
              child: SignInButton(
                Buttons.google,
                text: "Iniciar sesión con Google",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('¿No tienes cuenta?'),
                  TextButton(
                    child: const Text('Registrarse'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen())),
                  )
                ]),
                TextButton(
                  child: const Text('Olvide mi contraseña'),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
