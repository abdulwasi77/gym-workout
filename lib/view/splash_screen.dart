import 'package:gym_workout/utils/export_all.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const SegrecationScreen());
    });
    return Scaffold(
      body: SvgPicture.asset(
        AppAssets.splashImage,
        colorFilter: ColorFilter.mode(AppColor.redColor, BlendMode.colorDodge),
        fit: BoxFit.fill,
      ),
    );
  }
}
