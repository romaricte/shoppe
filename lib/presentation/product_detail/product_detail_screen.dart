import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/utils/colors.dart';
import '../../core/constants/image_constants.dart';
import '../../common/widgets/custom_text.dart';
import '../../common/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedImageIndex = 0;
  String selectedColor = "Pink";
  String selectedSize = "M";
  final PageController _pageController = PageController();
  late Timer _timer;
  
  final List<String> productImages = [
    ImageConstants.clothing1,
    ImageConstants.clothing2,
    ImageConstants.lingerie1,
    ImageConstants.lingerie2,
  ];

  @override
  void initState() {
    super.initState();
    // Timer pour faire défiler automatiquement les images
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (selectedImageIndex < productImages.length - 1) {
        selectedImageIndex++;
      } else {
        selectedImageIndex = 0;
      }
      _pageController.animateToPage(
        selectedImageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
  
  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image principale avec indicateurs et bouton de partage
            Stack(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedImageIndex = index;
                      });
                    },
                    itemCount: productImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        productImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      productImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == selectedImageIndex ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == selectedImageIndex
                              ? AppColors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.share, color: Colors.grey),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Prix
                  const BoldText(
                    text: "\$17,00",
                    fontSize: 26,
                  ),
                  const SizedBox(height: 10),
                  
                  // Description
                  const BodyText(
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
                    color: AppColors.grey,
                  ),
                  const SizedBox(height: 20),
                  
                  // Variations
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BoldText(
                        text: "Variations",
                        fontSize: 20,
                      ),
                      const Spacer(),
                      _colorOption("Pink"),
                      const SizedBox(width: 16),
                      _sizeOption("M"),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          // Action pour voir plus de variations
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Images de variation - maintenant cliquables pour changer l'image principale
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = 0;
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        child: _variationImage(ImageConstants.viewed1),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = 1;
                            _pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        child: _variationImage(ImageConstants.viewed2),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = 2;
                            _pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            );
                          });
                        },
                        child: _variationImage(ImageConstants.viewed3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  
                  // Section Specifications
                  const BoldText(
                    text: "Specifications",
                    fontSize: 22,
                  ),
                  const SizedBox(height: 15),
                  
                  // Matériel
                  const BoldText(
                    text: "Material",
                    fontSize: 16,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text("Cotton 95%"),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text("Nylon 5%"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Origine
                  const BoldText(
                    text: "Origin",
                    fontSize: 16,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text("EU"),
                  ),
                  const SizedBox(height: 20),
                  
                  // Guide des tailles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BoldText(
                        text: "Size guide",
                        fontSize: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  
                  // Section Livraison
                  const BoldText(
                    text: "Delivery",
                    fontSize: 22,
                  ),
                  const SizedBox(height: 15),
                  
                  // Option Standard
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BoldText(
                          text: "Standard",
                          fontSize: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("5-7 days"),
                        ),
                        const BoldText(
                          text: "\$3,00",
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Option Express
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BoldText(
                          text: "Express",
                          fontSize: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("1-2 days"),
                        ),
                        const BoldText(
                          text: "\$12,00",
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  
                  // Section Avis et évaluations
                  const BoldText(
                    text: "Rating & Reviews",
                    fontSize: 22,
                  ),
                  const SizedBox(height: 15),
                  
                  // Étoiles et notation
                  Row(
                    children: [
                      Row(
                        children: List.generate(4, (index) => 
                          const Icon(Icons.star, color: Colors.amber, size: 30),
                        ) + [
                          const Icon(Icons.star_border, color: Colors.amber, size: 30),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("4/5"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Commentaire individuel
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(ImageConstants.avatargirl),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BoldText(
                              text: "Veronika",
                              fontSize: 16,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: List.generate(4, (index) => 
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                              ) + [
                                const Icon(Icons.star_border, color: Colors.amber, size: 18),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const BodyText(
                              text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed ...",
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Bouton Voir tous les avis
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "View All Reviews",
                      backgroundColor: AppColors.blue,
                      onPressed: () {
                        Get.toNamed(AppRoutes.reviewScreen);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Boutons d'action
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: "Add to cart",
                          backgroundColor: Colors.black,
                          onPressed: () {
                            Get.toNamed(AppRoutes.cartScreen);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: "Buy now",
                          backgroundColor: AppColors.blue,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _colorOption(String color) {
    final bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          color,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _sizeOption(String size) {
    final bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
  Widget _variationImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}