import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return allAvailableMeals;
});
