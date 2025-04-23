import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/common/widgets/custom_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/countries.dart';

import 'package:shoppe/core/constants/image_constants.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // bool _obscureText = true;
  PhoneNumber? _phoneNumber;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Arrière-plan avec la forme bleue
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(ImageConstants.createAccount, fit: BoxFit.cover),
          ),
          // Contenu principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    // Titre "Create Account"
                    const Text(
                      'Create\nAccount',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Zone d'upload de photo
                    GestureDetector(
                      onTap: () {
                        // Get.dialog(
                        //   AlertDialog(
                        //     title: Text('Titre'),
                        //     content: Text('Contenu'),
                        //   ),
                        // );
                        // Get.bottomSheet(Container(
                        //   height: 200,
                        //   width: 200,
                        //   color: Colors.white,
                        //   child: Text('Contenu'),
                        // ));
                        Get.snackbar(
                          'Camera',
                          'You can upload your photo from camera',
                          duration: Duration(seconds: 5),
                          icon: Icon(Icons.camera),
                          dismissDirection: DismissDirection.vertical,

                        );
                      },
                      child: Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          ImageConstants.uploadPhoto,
                          width: 86,
                          height: 86,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Champ email
                    CustomTextField(
                      controller: _emailController,
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    // Champ mot de passe
                    CustomTextField(
                      controller: _passwordController,
                      hint: 'Password',
                      // obscureText: _obscureText,
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _obscureText ? Icons.visibility_off : Icons.visibility,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {
                      //     // setState(() {
                      //     //   _obscureText = !_obscureText;
                      //     // });
                      //   },
                      // ),
                    ),
                    const SizedBox(height: 16),
                    // Champ téléphone international
                    IntlPhoneField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: 'Your number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF1152FD),
                          ),
                        ),
                      ),
                      initialCountryCode: 'GB',
                      dropdownIconPosition: IconPosition.trailing,
                      dropdownIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 20,
                      ),
                      flagsButtonPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      showDropdownIcon: true,
                      disableLengthCheck: true,
                      onChanged: (phone) {
                        setState(() {
                          _phoneNumber = phone;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    // Bouton "Done"
                    CustomButton(
                      text: 'Done',
                      onPressed: () {
                        // Récupérer les valeurs du formulaire
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final completePhone = _phoneNumber?.completeNumber;

                        // Logique de soumission du formulaire
                        print('Email: $email');
                        print('Password: $password');
                        print('Phone: $completePhone');
                      },
                      backgroundColor: const Color(0xFF1152FD),
                    ),
                    const SizedBox(height: 20),
                    // Bouton "Cancel"
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
