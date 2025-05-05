import 'package:flutter/material.dart';
import '../../../core/constants/image_constants.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<WishlistItem> wishlistItems = [
    WishlistItem(
      image: 'assets/images/home/clothing1.png',
      price: 17.00,
      color: 'Pink',
      size: 'M',
    ),
    WishlistItem(
      image: 'assets/images/home/clothing2.png',
      originalPrice: 17.00,
      price: 12.00,
      color: 'Pink',
      size: 'M',
    ),
    WishlistItem(
      image: 'assets/images/home/lingerie1.png',
      price: 27.00,
      color: 'Pink',
      size: 'M',
    ),
    WishlistItem(
      image: 'assets/images/home/lingerie2.png',
      price: 19.00,
      color: 'Pink',
      size: 'M',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wishlist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Recently viewed',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildRecentlyViewedItem(ImageConstants.viewed1),
                  _buildRecentlyViewedItem(ImageConstants.viewed2),
                  _buildRecentlyViewedItem(ImageConstants.viewed3),
                  _buildRecentlyViewedItem(ImageConstants.viewed4),
                  _buildRecentlyViewedItem(ImageConstants.viewed5),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return _buildWishlistItem(item);
                },
              ),
            ),
            const CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyViewedItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildWishlistItem(WishlistItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      height: 120,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Lorem ipsum dolor sit amet consectetur.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    if (item.originalPrice != null)
                      Text(
                        '\$${item.originalPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    if (item.originalPrice != null)
                      const SizedBox(width: 8.0),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    _buildOptionTag(item.color),
                    const SizedBox(width: 8.0),
                    _buildOptionTag(item.size),
                    const Spacer(),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 16,
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

  Widget _buildOptionTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue.shade900,
        ),
      ),
    );
  }
}

class WishlistItem {
  final String image;
  final double? originalPrice;
  final double price;
  final String color;
  final String size;

  WishlistItem({
    required this.image,
    this.originalPrice,
    required this.price,
    required this.color,
    required this.size,
  });
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, true),
          _buildNavItem(Icons.favorite, false, isSelected: true),
          _buildNavItem(Icons.list_alt_outlined, false),
          _buildNavItem(Icons.shopping_cart_outlined, false),
          _buildNavItem(Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isHome, {bool isSelected = false}) {
    return Container(
      width: 60,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: isSelected
            ? const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              )
            : null,
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.grey,
        size: 24,
      ),
    );
  }
}