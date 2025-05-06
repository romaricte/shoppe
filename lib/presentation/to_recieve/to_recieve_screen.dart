import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';

class ToRecieveScreen extends StatefulWidget {
  const ToRecieveScreen({super.key});

  @override
  State<ToRecieveScreen> createState() => _ToRecieveScreenState();
}

class _ToRecieveScreenState extends State<ToRecieveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _buildOrderCard(
                    status: 'Packed',
                    itemCount: 3,
                    images: [
                      ImageConstants.avatargirl,
                      ImageConstants.clothing1,
                      ImageConstants.clothing2,
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildOrderCard(
                    status: 'Shipped',
                    itemCount: 4,
                    images: [
                      ImageConstants.shoes,
                      ImageConstants.clothing2,
                      ImageConstants.clothing1,
                      ImageConstants.lingerie,
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildOrderCard(
                    status: 'Delivered',
                    itemCount: 2,
                    images: [
                      ImageConstants.lingerie1,
                      ImageConstants.clothing2,
                    ],
                    showReview: true,
                  ),
                  const SizedBox(height: 12),
                  _buildOrderCard(
                    status: 'Delivered',
                    itemCount: 5,
                    images: [
                      ImageConstants.lingerie,
                      ImageConstants.clothing,
                      ImageConstants.shoes,
                      ImageConstants.clothing1,
                    ],
                    showReview: true,
                  ),
                  const SizedBox(height: 12),
                  _buildOrderCard(
                    status: 'Delivered',
                    itemCount: 1,
                    images: [
                      ImageConstants.lingerie2,
                    ],
                    showReview: true,
                    backgroundColor: Colors.purple[400],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(ImageConstants.avatargirl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BoldText(
                  text: 'To Recieve',
                  fontSize: 22,
                  color: Colors.black87,
                ),
                SizedBox(height: 4),
                BodyText(
                  text: 'My Orders',
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.message, color: Colors.blue),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.menu, color: Colors.blue),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.settings, color: Colors.blue),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String status,
    required int itemCount,
    required List<String> images,
    bool showReview = false,
    Color? backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BoldText(
                        text: 'Order #92287157',
                        fontSize: 16,
                      ),
                      const SizedBox(height: 4),
                      BodyText(
                        text: 'Standard Delivery',
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                BoldText(
                  text: '$itemCount items',
                  fontSize: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOrderImages(images, backgroundColor),
                const Spacer(),
                status == 'Delivered'
                    ? Row(
                        children: [
                          BoldText(
                            text: status,
                            fontSize: 16,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      )
                    : BoldText(
                        text: status,
                        fontSize: 16,
                      ),
                const SizedBox(width: 16),
                showReview
                    ? Container(
                        height: 40,
                        child: CustomButton(
                          text: 'Review',
                          width: 100,
                          height: 36,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue,
                          onPressed: () {},
                        ),
                      )
                    : Container(
                        height: 40,
                        child: CustomButton(
                          text: 'Track',
                          width: 100,
                          height: 36,
                          backgroundColor: Colors.blue,
                          onPressed: () {},
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderImages(List<String> images, Color? backgroundColor) {
    return Container(
      height: 70,
      width: images.length * 25.0 + 25.0,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          for (int i = 0; i < images.length && i < 4; i++)
            Positioned(
              left: i * 25.0,
              child: Container(
                height: images.length == 1 ? 70 : 50,
                width: images.length == 1 ? 70 : 50,
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(images[i]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}