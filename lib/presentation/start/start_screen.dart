import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';

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
              text: 'Hello',
              fontSize: 24,
                fontWeight: FontWeight.bold,
              
            ),
        ],
      ),
    );
  }
}