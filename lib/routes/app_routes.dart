import 'package:get/get.dart';
import 'package:shoppe/presentation/auth/login/login_screen.dart';
import 'package:shoppe/presentation/start/start_screen.dart';
import 'package:shoppe/presentation/auth/create%20account/create_account_screen.dart'; 

class AppRoutes {
  static const String startScreen = '/startScreen'; 
  static const String createAccountScreen = '/createAccountScreen';
  static const String loginScreen = '/loginScreen';

  static List<GetPage> pages = [
    GetPage(
      name: startScreen,
      page: () => const StartScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: createAccountScreen,
      page: () => const CreateAccountScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
