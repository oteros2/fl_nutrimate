import 'package:NutriMate/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_button/sign_in_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'nombre': 'nombre',
      'email': 'email',
      'contraseña': 'contraseña'
    };
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/fondo.svg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: screenWidth / 1.6,
              ),
              Form(
                child: Container(
                  width: screenWidth / 1.2,
                  child: Column(
                    children: [
                      CustomTextFormField(
                          labelText: 'Nombre y apellidos',
                          hintText: 'Nombre y apellidos',
                          obscureText: false,
                          formProperty: 'nombre',
                          formValues: formValues),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          formProperty: 'email',
                          formValues: formValues),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                          labelText: 'Contraseña',
                          hintText: 'Contraseña',
                          obscureText: true,
                          formProperty: 'contraseña',
                          formValues: formValues),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ElevatedButton(
                          child: const Text('Registrarse'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(width: screenWidth / 1.2, child: const Divider()),
              const SizedBox(height: 15),
              SizedBox(
                width: screenWidth / 1.2,
                child: SignInButton(
                  Buttons.google,
                  text: "Iniciar sesión con Google",
                  onPressed: () {},
                ),
              ),
            ],
          )),
        ),
      ]),
    );
  }
}
