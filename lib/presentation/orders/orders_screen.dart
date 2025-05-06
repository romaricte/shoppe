import 'package:flutter/material.dart';
import 'package:shoppe/core/constants/image_constants.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImageConstants.avatargirl),
            ),
            const SizedBox(width: 12),
            const Text(
              'History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOrderItem(
            imagePath: ImageConstants.clothing,
            date: 'April.06',
            orderId: '92287157',
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            imagePath: ImageConstants.clothing1,
            date: 'April.06',
            orderId: '92287157',
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            imagePath: ImageConstants.clothing2,
            date: 'April.06',
            orderId: '92287157',
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            imagePath: ImageConstants.lingerie,
            date: 'April.06',
            orderId: '92287157',
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String imagePath,
    required String date,
    required String orderId,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: SizedBox(
              width: 110,
              height: 110,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Order #$orderId',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Review'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}