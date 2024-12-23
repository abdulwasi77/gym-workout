import 'package:gym_workout/utils/export_all.dart';

class FavouriteTrainersController extends GetxController {
  final searchController = TextEditingController();

  bool isFavourite = false;

  final List<Map<String, String>> trainers = [
    {
      "name": "John Doe",
      "specialty": "Strength Training",
      "image": AppAssets.avatarImage,
    },
    {
      "name": "Jane Smith",
      "specialty": "Yoga",
      "image": AppAssets.avatarImage,
    },
    {
      "name": "Mark Lee",
      "specialty": "Cardio",
      "image": AppAssets.avatarImage,
    },
    {
      "name": "Emily Johnson",
      "specialty": "Pilates",
      "image": AppAssets.avatarImage,
    },
    {
      "name": "Jack",
      "specialty": "Pilates",
      "image": AppAssets.avatarImage,
    },
    {
      "name": "Mitchel",
      "specialty": "Pilates",
      "image": AppAssets.avatarImage,
    },
  ];

  late List<Map<String, String>> filteredTrainers; // List for filtered trainers

  void filterTrainers(String query) {
    filteredTrainers = trainers
        .where((trainer) => trainer['name']!
            .toLowerCase()
            .contains(query.toLowerCase())) // Case-insensitive search
        .toList();
    update();
  }

  void makeFavourite() {
    isFavourite = !isFavourite;
    update();
  }
}
