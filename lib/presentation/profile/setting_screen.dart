import 'package:flutter/material.dart';
import '../../common/widgets/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BoldText(
          text: "Settings",
          fontSize: 24,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Personnelle
              const SubtitleText(
                text: "Personal",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              
              // Profil
              buildSettingItem(
                title: "Profile",
                onTap: () {},
              ),
              const Divider(),
              
              // Adresse de livraison
              buildSettingItem(
                title: "Shipping Address",
                onTap: () {},
              ),
              const Divider(),
              
              // Méthodes de paiement
              buildSettingItem(
                title: "Payment methods",
                onTap: () {},
              ),
              const Divider(),
              
              const SizedBox(height: 24),
              
              // Section Boutique
              const SubtitleText(
                text: "Shop",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              
              // Pays
              buildSettingItem(
                title: "Country", 
                value: "Vietnam",
                onTap: () {},
              ),
              const Divider(),
              
              // Devise
              buildSettingItem(
                title: "Currency", 
                value: "\$ USD",
                onTap: () {},
              ),
              const Divider(),
              
              // Tailles
              buildSettingItem(
                title: "Sizes", 
                value: "UK",
                onTap: () {},
              ),
              const Divider(),
              
              // Conditions générales
              buildSettingItem(
                title: "Terms and Conditions",
                onTap: () {},
              ),
              const Divider(),
              
              const SizedBox(height: 24),
              
              // Section Compte
              const SubtitleText(
                text: "Account",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              
              // Langue
              buildSettingItem(
                title: "Language", 
                value: "English",
                onTap: () {},
              ),
              const Divider(),
              
              // À propos
              buildSettingItem(
                title: "About Slada",
                onTap: () {},
              ),
              const Divider(),
              
              const SizedBox(height: 24),
              
              // Supprimer le compte
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: BodyText(
                    text: "Delete My Account",
                    color: Colors.red[400],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Section "Slada" et version
              Center(
                child: Column(
                  children: const [
                    BoldText(
                      text: "Slada",
                      fontSize: 20,
                    ),
                    SizedBox(height: 4),
                    CaptionText(
                      text: "Version 1.0 April, 2020",
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildSettingItem({
    required String title, 
    String? value, 
    required VoidCallback onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
              text: title,
              fontSize: 16,
            ),
            Row(
              children: [
                if (value != null)
                  BodyText(
                    text: value,
                    color: Colors.grey[700],
                  ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}