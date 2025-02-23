import 'package:NutriMate/services/firebase_auth_service.dart';
import 'package:NutriMate/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../services/services.dart';
import 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'email': 'email',
      'contraseña': 'contraseña'
    };
    double screenWidth = MediaQuery.of(context).size.width;
    final AuthService _authService = AuthService();

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
                  key: myFormKey,
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth / 1.2,
                        child: Column(
                          children: [
                            CustomEmailFormField(
                              hintText: 'Email',
                              labelText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              formProperty: 'email',
                              formValues: formValues,
                            ),
                            const SizedBox(height: 15),
                            CustomPasswordFormField(
                              hintText: 'Contraseña',
                              labelText: 'Contraseña',
                              formProperty: 'contraseña',
                              formValues: formValues,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ElevatedButton(
                          child: const Text('Iniciar sesion'),
                          onPressed: () async {
                            if (myFormKey.currentState!.validate()) {
                              User? user = await _authService.signIn(
                                formValues['email']!,
                                formValues['contraseña']!,
                                context,
                              );
                              if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => TabScreen()),
                                  (route) => false,
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 15),
              Container(width: screenWidth / 1.2, child: const Divider()),
              const SizedBox(height: 15),
              SizedBox(
                width: screenWidth / 1.2,
                child: SignInButton(Buttons.google,
                    text: "Iniciar sesión con Google",
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => TabScreen()),
                          (route) => false,
                        )),
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('¿No tienes cuenta?'),
                    TextButton(
                        child: const Text('Registrarse'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        })
                  ]),
                  TextButton(
                      child: const Text('Olvide mi contraseña'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecoveryScreen()),
                        );
                      })
                ],
              ),
            ],
          ),
        )),
      ]),
    );
  }
}
