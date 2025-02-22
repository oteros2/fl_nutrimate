import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../services/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'nombre': '',
    'apellidos': '',
    'email': '',
    'contraseña': ''
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
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
                    key: _formKey,
                    child: Container(
                      width: screenWidth / 1.2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: CustomTextFormField(
                                    labelText: 'Nombre',
                                    hintText: 'Nombre',
                                    formProperty: 'nombre',
                                    formValues: formValues,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: CustomTextFormField(
                                    labelText: 'Apellidos',
                                    hintText: 'Apellidos',
                                    formProperty: 'apellidos',
                                    formValues: formValues,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomEmailFormField(
                            labelText: 'Email',
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            formProperty: 'email',
                            formValues: formValues,
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordFormField(
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                            formProperty: 'contraseña',
                            formValues: formValues,
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: ElevatedButton(
                              child: const Text('Registrarse'),
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                  final errorMessage =
                                      await authService.registerUser(
                                    nombre: formValues['nombre']!,
                                    apellidos: formValues['apellidos']!,
                                    email: formValues['email']!,
                                    password: formValues['contraseña']!,
                                    context: context,
                                  );

                                  if (errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(errorMessage)),
                                    );
                                  }
                                }
                              },
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
