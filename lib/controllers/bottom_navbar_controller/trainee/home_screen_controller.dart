import 'package:gym_workout/utils/export_all.dart';

class HomeScreenController extends GetxController {
  double progress = 60.0;
  final PageController pageController = PageController();
  DateTime? selectedDate;

  void selectDate(DateTime value) {
    selectedDate = value;
    update();
  }

  List<Map<String, dynamic>> backendData = [
    {
      'foodItem': 'Grilled Chicken (100g)',
      'protein': 31.0,
      'calories': 165,
      'total': '31g protein, 165 calories',
    },
    {
      'foodItem': 'Salmon (100g)',
      'protein': 25.0,
      'calories': 200,
      'total': '25g protein, 200 calories',
    },
    // More items here
  ];
}
