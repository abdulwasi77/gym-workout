import 'package:gym_workout/utils/export_all.dart';

class TrainersScreenController extends GetxController {
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

  // Filter variables
  final List<String> specialties = [
    "Strength Training",
    "Yoga",
    "Cardio",
    "Pilates",
  ];

  final List<String> experienceLevels = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];

  String? selectedSpecialty;
  String? selectedExperienceLevel;

  @override
  void onInit() {
    super.onInit();
    // Initially, all trainers are shown.
    filteredTrainers = trainers;
  }

  void updateSpecialty(String? newValue) {
    selectedSpecialty = newValue;
    update();
  }

  // Update the selected experience level for filtering
  void updateExperienceLevel(String? newValue) {
    selectedExperienceLevel = newValue;
    update();
  }

  // Apply filters based on selected specialty and experience level
  void applyFilters() {
    filteredTrainers = trainers.where((trainer) {
      // Filter by specialty
      bool matchesSpecialty = selectedSpecialty == null ||
          trainer["specialty"] == selectedSpecialty;

      // Filter by experience level (Example: This could be another attribute in the trainer data)
      bool matchesExperienceLevel = selectedExperienceLevel == null ||
          // Assuming we have an 'experienceLevel' key in the trainer data, which is not currently present in your list
          trainer["experienceLevel"] == selectedExperienceLevel;

      return matchesSpecialty && matchesExperienceLevel;
    }).toList();
    update();
  }
}
