import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';

class JustForYou extends StatefulWidget {
  const JustForYou({super.key});

  @override
  State<JustForYou> createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CustomText(
                text: 'Just For You',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 8),
              Icon(Icons.star, color: Colors.blue[700], size: 20),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return _buildProductCard(index);
          },
        ),
      ],
    );
  }

  Widget _buildProductCard(int index) {
    // Liste des images disponibles dans ImageConstants
    final List<String> productImages = [
      ImageConstants.clothing,
      ImageConstants.shoes,
      ImageConstants.lingerie,
      ImageConstants.clothing1,
      ImageConstants.shoes1, 
      ImageConstants.lingerie1,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: _getBackgroundColor(index),
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              index < productImages.length ? productImages[index] : ImageConstants.newitems1,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: _getBackgroundColor(index),
                  child: const Center(
                    child: Icon(Icons.image, size: 40, color: Colors.white54),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        const CustomText(
          text: 'Lorem ipsum dolor sit amet consectetur',
          fontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        const CustomText(
          text: '\$17,00',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Color _getBackgroundColor(int index) {
    switch (index % 6) {
      case 0:
        return Colors.grey.shade300;
      case 1:
        return Colors.amber.shade300;
      case 2:
        return Colors.red.shade300;
      case 3:
        return Colors.brown.shade200;
      case 4:
        return Colors.pink.shade300;
      case 5:
        return Colors.purple.shade300;
      default:
        return Colors.blue.shade300;
    }
  }
}