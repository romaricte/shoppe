import 'package:get/get.dart';


class AppRoutes {
  static const String signInScreen = '/signInScreen';
  static const String splashScreen = '/splashScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String signInSignInScreen = '/signInSignInScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String chooseTopicScreen = '/chooseTopicScreen'; 
  static const String remindersScreen = '/remindersScreen';
  static const String homeScreen = '/homeScreen';
  static const String courseDetailScreen = '/courseDetailScreen';
  static const String musicScreen = '/musicScreen';
  static const String playOptionScreen = '/playOptionScreen';
  static const String musicsScreen = '/musicsScreen';

  static List<GetPage> pages = [
    GetPage(
      transition: Transition.rightToLeft,
      name: signInScreen,
      page: () => const SignInScreen(),
    ),
   
  ];
}
