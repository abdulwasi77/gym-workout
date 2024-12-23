import 'package:gym_workout/utils/export_all.dart';

class TrainerHomeScreen extends StatelessWidget {
  const TrainerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: CustomAppBars.primaryAppBar(
        title: "Home",
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu),
        ),
        action: [
          Badge.count(
            count: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const NotificationsScreen());
              },
              child: const Icon(Icons.notifications),
            ),
          ).paddingOnly(right: 15.w),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: AppTexts.blackText(title: "Trainer Home Screen")),
        ],
      ),
    );
  }
}
