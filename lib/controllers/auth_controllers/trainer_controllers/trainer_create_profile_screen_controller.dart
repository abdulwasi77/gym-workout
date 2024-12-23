import 'dart:io';
import 'package:gym_workout/utils/export_all.dart';
import 'package:intl/intl.dart';

class TrainerCreateProfileScreenController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final specialtyController = TextEditingController();
  final experienceController = TextEditingController();
  final aboutController = TextEditingController();
  List<String> selectedDays = []; // Selected bility
  final certificationsController = TextEditingController();
  List<String> genderOptions = ["Male", "Female"];
  String? genderValue;
  File? selectedImage;

  DateTime? selectedDate;
  // int age = 0;

  // Function to calculate age based on the selected date of birth
  // int calculateAge(DateTime birthDate) {
  //   final currentDate = DateTime.now();
  //   int age = currentDate.year - birthDate.year;
  //   if (currentDate.month < birthDate.month ||
  //       (currentDate.month == birthDate.month &&
  //           currentDate.day < birthDate.day)) {
  //     age--;
  //   }
  //   return age;
  // }

  // Function to show the date picker
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900), // Set minimum selectable date
      lastDate: DateTime.now(), // Set maximum selectable date (today)
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor, // Set the header color
            hintColor: AppColor
                .primaryColor, // Set accent color for buttons and other elements
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Button text theme
              buttonColor: AppColor.primaryColor, // Set button color
            ),
            colorScheme: ColorScheme.light(
                primary: AppColor.primaryColor), // Set primary color
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      // dobController.text = calculateAge(picked).toString();
      update();
    }
  }

  void selectGender(String value) {
    genderValue = value;
    update();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage = File(picked.path);
    }
    update();
  }

  void addAvaibility(String value) {
    selectedDays.add(value);
    update();
  }
}
