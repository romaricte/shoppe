import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/utils/colors.dart';
import 'package:shoppe/core/constants/image_constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const BoldText(
              text: 'Cart',
              fontSize: 28,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEEF0FF),
              ),
              child: const BoldText(
                text: '2',
                color: AppColors.blue,
                fontSize: 14,
              ),
            ),
          ],
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
              // Adresse de livraison
              const BoldText(
                text: 'Shipping Address',
                fontSize: 18,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BodyText(
                        text: '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Articles du panier
              _buildCartItem(
                image: ImageConstants.viewed1,
                description: 'Lorem ipsum dolor sit amet consectetur.',
                color: 'Pink',
                size: 'Size M',
                price: '\$17,00',
              ),
              const SizedBox(height: 16),
              _buildCartItem(
                image: ImageConstants.viewed2,
                description: 'Lorem ipsum dolor sit amet consectetur.',
                color: 'Pink',
                size: 'Size M',
                price: '\$17,00',
              ),
              
              const SizedBox(height: 24),
              
              // Wishlist
              const BoldText(
                text: 'From Your Wishlist',
                fontSize: 22,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              _buildWishlistItem(
                image: ImageConstants.viewed3,
                description: 'Lorem ipsum dolor sit amet consectetur.',
                price: '\$17,00',
                color: 'Pink',
                size: 'M',
              ),
              const SizedBox(height: 16),
              _buildWishlistItem(
                image: ImageConstants.viewed4,
                description: 'Lorem ipsum dolor sit amet consectetur.',
                price: '\$17,00',
              ),
              
              const SizedBox(height: 24),
              
              // Total et bouton de checkout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      BoldText(
                        text: 'Total',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      BoldText(
                        text: '\$34,00',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 160,
                    child: CustomButton(
                      text: 'Checkout',
                      backgroundColor: AppColors.blue,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String description,
    required String color,
    required String size,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Image du produit avec bouton de suppression
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Détails du produit
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  text: description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                BoldText(
                  text: '$color, $size',
                  color: Colors.black,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoldText(
                      text: price,
                      fontSize: 18,
                    ),
                    Row(
                      children: [
                        _buildQuantityButton(
                          icon: Icons.remove,
                          onPressed: () {},
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: const BoldText(
                            text: '1',
                            fontSize: 16,
                          ),
                        ),
                        _buildQuantityButton(
                          icon: Icons.add,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistItem({
    required String image,
    required String description,
    required String price,
    String? color,
    String? size,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Image du produit avec bouton de suppression
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Détails du produit
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  text: description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                if (color != null && size != null) ...[
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: BodyText(
                          text: color,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: BodyText(
                          text: size,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoldText(
                      text: price,
                      fontSize: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blue,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
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
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.blue),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.blue),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}