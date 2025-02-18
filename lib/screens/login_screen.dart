import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: screenWidth / 1.5),
            Form(
              key: myFormKey,
              child: Container(
                width: screenWidth / 1.2,
                child: Column(
                  children: [
                    CustomTextFormField(
                        hintText: 'Usuario',
                        labelText: 'Usuario',
                        obscureText: false,
                        formProperty: 'usuario',
                        formValues: formValues),
                    SizedBox(height: 15),
                    CustomTextFormField(
                        hintText: 'Contraseña',
                        labelText: 'Contraseña',
                        obscureText: true,
                        formProperty: 'contraseña',
                        formValues: formValues),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        child: Text('Acceder'),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 5),
                    const Divider(),
                    Container(
                      width: double.infinity,
                      child: SignInButton(
                        Buttons.google,
                        text: "Iniciar sesión con Google",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text('¿No tienes cuenta?'),
                          TextButton(
                            child: Text('Registrarse'),
                            onPressed: () {},
                          )
                        ]),
                        TextButton(
                          child: Text('Olvide mi contraseña'),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Image.asset('assets/images/huella.png', width: screenWidth / 6),
          ],
        ),
      ),
    );
  }
}
