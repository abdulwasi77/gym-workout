import 'package:gym_workout/dashboard_screen.dart';
import 'package:gym_workout/utils/export_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LocalStorageService localStorageService = LocalStorageService();
  await localStorageService.initializeStorage();
  Get.put(SegrecationController(), permanent: true);
  Get.put(BottomNavbarController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
