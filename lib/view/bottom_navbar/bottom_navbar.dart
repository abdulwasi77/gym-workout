import 'package:gym_workout/utils/export_all.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final SegrecationController segrecationController =
        Get.put(SegrecationController());
    final BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController());

    return GetBuilder<BottomNavbarController>(
      init: bottomNavbarController,
      builder: (_) => Scaffold(
        drawer: const CustomDrawerWidget(),
        body: segrecationController.getUserTypeFromStorage() ==
                AppConstants.trainee
            ? bottomNavbarController
                .screens[bottomNavbarController.selectedIndex]
            : bottomNavbarController
                .trainerScreens[bottomNavbarController.selectedIndex],
        bottomNavigationBar: _buildBottomNavbar(
            context, bottomNavbarController, segrecationController),
      ),
    );
  }

  Widget _buildBottomNavbar(
      BuildContext context,
      BottomNavbarController bottomNavbarController,
      SegrecationController segrecationController) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
        color: AppColor.primaryColor,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: AppColor.whiteColor.withValues(alpha: 0.7),
        selectedItemColor: AppColor.yellowColor,
        backgroundColor: AppColor.transparentColor,
        currentIndex: bottomNavbarController.selectedIndex,
        onTap: (index) {
          bottomNavbarController.changeIndex(index);
        },
        items: segrecationController.getUserTypeFromStorage() ==
                AppConstants.trainee
            ? bottomNavbarController.traineeBars
            : bottomNavbarController.trainerBars,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColor.whiteColor),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: AppColor.whiteColor.withValues(alpha: 0.7)),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
