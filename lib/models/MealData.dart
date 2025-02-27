import 'entities.dart';

class MealData {
  final String imageUrl;
  final MealType? type;
  final String dinner;

  MealData({
    required this.imageUrl,
    this.type,
    required this.dinner,
  });
}
