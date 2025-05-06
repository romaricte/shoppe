import 'package:get/get.dart';
import 'package:shoppe/presentation/auth/login/login_screen.dart';
import 'package:shoppe/presentation/auth/verify_otp/verify_otp_screen.dart';
import 'package:shoppe/presentation/home/home_screen.dart';
import 'package:shoppe/presentation/my_activity/my_activity_screen.dart';
import 'package:shoppe/presentation/payment/payment.dart';
import 'package:shoppe/presentation/product_detail/product_detail_screen.dart';
import 'package:shoppe/presentation/start/start_screen.dart';
import 'package:shoppe/presentation/auth/create%20account/create_account_screen.dart'; 
import 'package:shoppe/presentation/reviews/review_screen.dart';
import 'package:shoppe/presentation/cart/cart_screen.dart';
import 'package:shoppe/presentation/to_recieve/to_recieve_screen.dart';
import 'package:shoppe/presentation/orders/orders_screen.dart';

class AppRoutes {
  static const String startScreen = '/startScreen'; 
  static const String createAccountScreen = '/createAccountScreen';
  static const String loginScreen = '/loginScreen';
  static const String verifyOtpScreen = '/verifyOtpScreen';
  static const String homeScreen = '/homeScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String productDetailScreen = '/productDetailScreen';
  static const String reviewScreen = '/reviewScreen';
  static const String cartScreen = '/cartScreen';
  static const String toRecieveScreen = '/toRecieveScreen';
  static const String myActivityScreen = '/myActivityScreen';
  static const String ordersScreen = '/ordersScreen';
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
    GetPage(
      name: verifyOtpScreen,
      page: () => const VerifyOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: paymentScreen,
      page: () => const Payment(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: productDetailScreen,
      page: () => const ProductDetailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: reviewScreen,
      page: () => const ReviewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: toRecieveScreen,
      page: () => const ToRecieveScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: myActivityScreen,
      page: () => const MyActivityScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ordersScreen,
      page: () => const OrdersScreen(),
      transition: Transition.rightToLeft,
    ),
    ];
}
