import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1000),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Introduce el email que usaste para registrarte en Nutrimate y te enviaremos un correo con instrucciones para recuperar tu contraseña',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Form(
                  child: Column(children: [
                SizedBox(height: 15),
                Container(
                  width: screenWidth / 1.2,
                  child: CustomEmailFormField(
                    hintText: 'Email',
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
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
    ]));
  }
}
