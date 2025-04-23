import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';
import 'package:shoppe/routes/app_routes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      ImageConstants.logo,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomText(
                text: 'Shoppe',
                fontSize: 36,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 15),
              const CustomText(
                text: 'Beautiful eCommerce UI Kit',
                fontSize: 16,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              const SizedBox(height: 5),
              const CustomText(
                text: 'for your online store',
                fontSize: 16,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              const Spacer(flex: 3),
              CustomButton(
                text: "Let's get started",
                backgroundColor: AppColors.blue,
                onPressed: () {
                  Get.toNamed(AppRoutes.createAccountScreen);
                },
                width: size.width,
                height: 56,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'I already have an account',
                    fontSize: 14,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}