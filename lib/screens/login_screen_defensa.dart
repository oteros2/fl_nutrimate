import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/services.dart';
import 'screens.dart';

class LoginScreenDefensa extends StatefulWidget {
  const LoginScreenDefensa({Key? key}) : super(key: key);
  @override
  State<LoginScreenDefensa> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenDefensa> {
  final _loginFormKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final Map<String, String> formValues = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      SizedBox(
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
                            CustomPasswordLogin(
                              hintText: 'Contraseña',
                              labelText: 'Contraseña',
                              formProperty: 'password',
                              formValues: formValues,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ElevatedButton(
                          child: const Text('Iniciar sesión'),
                          onPressed: () async {
                            _authService.iniciarSesion(
                                formValues['email']!.trim(),
                                formValues['password']!,
                                context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(width: screenWidth / 1.2, child: const Divider()),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('¿No tienes cuenta?'),
                  TextButton(
                    child: const Text('Registrarse'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreenDefensa()),
                      );
                    },
                  )
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
