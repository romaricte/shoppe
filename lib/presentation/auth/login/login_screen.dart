import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.login),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),
                const CustomText(
                  text: 'Login',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                const CustomText(
                  text: 'Good to see you back! ♥',
                  fontSize: 16,
                  color: Colors.black54,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    
                  },
                  backgroundColor: const Color(0xFF1152FD),
                ),
               
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // TODO: Implement cancel logic
                  },
                  child: const CustomText(
                    text: 'Cancel',
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
