import 'package:gym_workout/utils/export_all.dart';

class TrainerDetailController extends GetxController {
  bool isFavorite = false;
  double rating = 4.5;

  void favourite() {
    isFavorite = !isFavorite;
    update();
  }

  void updateRating(double value) {
    rating = value;
    update();
  }
}
