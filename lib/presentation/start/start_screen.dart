import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70),
              ),
              child: Image.asset(ImageConstants.logo),
            ),
            CustomText(
              text: 'Shoppe',
              fontSize: 24,
              fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              
            ),
            CustomText(
              text: 'Beautiful eCommerce UI Kit for your online store',
              fontSize: 16,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: 20),
           
           CustomButton(
            text: "Let's get started",
            backgroundColor: AppColors.blue,
            onPressed: () {
            },
           ),

           SizedBox(height: 20),

          Row(
            children: [
              CustomText(
                text: 'Already have an account?',
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}