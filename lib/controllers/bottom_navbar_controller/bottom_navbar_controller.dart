import 'package:gym_workout/utils/export_all.dart';

class BottomNavbarController extends GetxController {
  final List<Widget> trainerScreens = [
    const TrainerHomeScreen(),
    const ClientsScreen(),
    const SettingsScreen(),
  ];
  final List<Widget> screens = [
    const HomeScreen(),
    const AllTrainers(),
    const AllTraineesScreen(),
    const SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> trainerBars = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.switch_account_outlined),
      label: 'Clients',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  final List<BottomNavigationBarItem> traineeBars = [
    BottomNavigationBarItem(
      backgroundColor: AppColor.primaryColor,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      backgroundColor: AppColor.primaryColor,
      icon: const Icon(Icons.settings_accessibility_outlined),
      label: 'Trainers',
    ),
    BottomNavigationBarItem(
      backgroundColor: AppColor.primaryColor,
      icon: const Icon(Icons.switch_account_outlined),
      label: 'Trainees',
    ),
    BottomNavigationBarItem(
      backgroundColor: AppColor.primaryColor,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];
  var selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
