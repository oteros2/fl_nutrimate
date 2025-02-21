import 'package:flutter/material.dart';

class SwiperFoodLabel extends StatelessWidget {
  final String day;
  final String? label;

  const SwiperFoodLabel({
    super.key,
    required this.day,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Container(
          color: const Color(0xFF00B894).withAlpha(50),
          child: ListTile(
            title: Text(day),
            subtitle: Text(label ?? ''),
          ),
        ),
      ],
    );
  }
}
