import 'package:NutriMate/models/user.dart';
import 'package:NutriMate/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.user == null) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: const Color(0xFFF8F1C0).withAlpha(100),
          width: double.infinity,
          height: 475,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  child: Text("A16"),
                  backgroundColor: Colors.green,
                  radius: 50,
                ),
                const SizedBox(height: 15),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _WeightCard(text: 'Peso inicial', weight: 70.0),
                    const SizedBox(width: 10),
                    _WeightCard(text: 'Peso actual', weight: user.weight),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const _UpdateWeightButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpdateWeightButton extends StatelessWidget {
  const _UpdateWeightButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      child: const Text('ACTUALIZAR PESO'),
    );
  }
}

class _WeightCard extends StatelessWidget {
  final String text;
  final double weight;
  const _WeightCard({
    super.key,
    required this.text,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$weight kg',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
