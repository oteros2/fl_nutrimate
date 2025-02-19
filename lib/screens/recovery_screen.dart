import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'email': 'email',
    };
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: screenWidth / 1.6,
              ),
              Text('¿Has olvidado tu contraseña?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 15),
              Text('Introduce el email que usaste para registrarte',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              Text('en Nutrimate y te enviaremos un correo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              Text('electronico para que puedas cambiar tu contraseña',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              Form(
                  child: Column(children: [
                SizedBox(height: 15),
                Container(
                  width: screenWidth / 1.2,
                  child: CustomTextFormField(
                    hintText: 'Email',
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    formProperty: 'email',
                    formValues: formValues,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: ElevatedButton(
                      child: const Text('Recuperar contraseña'),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()))),
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
