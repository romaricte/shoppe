import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_button.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/utils/colors.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedShipping = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TitleText(
          text: 'Payment',
          color: Colors.black,
          textAlign: TextAlign.left,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address
            _buildSectionWithEdit(
              title: 'Shipping Address',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BodyText(
                    text: '26, Duong So 2, Thao Dien Ward, An Phu, District 2,',
                    color: Colors.black87,
                  ),
                  SizedBox(height: 4),
                  BodyText(
                    text: 'Ho Chi Minh city',
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Contact Information
            _buildSectionWithEdit(
              title: 'Contact Information',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BodyText(
                    text: '+237699999999',
                    color: Colors.black87,
                  ),
                  SizedBox(height: 4),
                  BodyText(
                    text: 'ROMARIC@example.com',
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const TitleText(
                      text: 'Items',
                      textAlign: TextAlign.left,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7EAFF),
                        shape: BoxShape.circle,
                      ),
                      child: const BodyText(
                        text: '2',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _showVouchersBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.blue,
                    elevation: 0,
                    side: const BorderSide(color: AppColors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Add Voucher'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Item 1
            _buildItemCard(
              itemImage: 'assets/images/home/clothing1.png',
              quantity: '1',
              price: '\$17,00',
            ),
            
            const SizedBox(height: 12),
            
            // Item 2
            _buildItemCard(
              itemImage: 'assets/images/home/clothing2.png',
              quantity: '1',
              price: '\$17,00',
            ),
            
            const SizedBox(height: 24),
            
            // Shipping Options
            const TitleText(
              text: 'Shipping Options',
              textAlign: TextAlign.left,
              color: Colors.black,
            ),
            
            const SizedBox(height: 16),
            
            // Standard Shipping
            _buildShippingOption(
              title: 'Standard',
              days: '5-7 days',
              price: 'FREE',
              isSelected: selectedShipping == 'Standard',
              onTap: () {
                setState(() {
                  selectedShipping = 'Standard';
                });
              },
            ),
            
            const SizedBox(height: 12),
            
            // Express Shipping
            _buildShippingOption(
              title: 'Express',
              days: '1-2 days',
              price: '\$12,00',
              isSelected: selectedShipping == 'Express',
              onTap: () {
                setState(() {
                  selectedShipping = 'Express';
                });
              },
            ),
            
            const SizedBox(height: 12),
            
            // Delivery date
            const BodyText(
              text: 'Delivered on or before Thursday, 23 April 2020',
              color: Colors.black87,
            ),
            
            const SizedBox(height: 24),
            
            // Payment Method
            _buildSectionWithEdit(
              title: 'Payment Method',
              content: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EAFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Card',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BodyText(
                  text: 'Total',
                  color: Colors.black87,
                ),
                TitleText(
                  text: '\$34,00',
                  textAlign: TextAlign.left,
                  color: Colors.black,
                ),
              ],
            ),
            CustomButton(
              text: 'Pay',
              onPressed: () {},
              width: 150,
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  void _showVouchersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(
                text: 'Active Vouchers',
                textAlign: TextAlign.left,
                color: Colors.black,
              ),
              const SizedBox(height: 24),
              
              // Premier coupon
              _buildVoucherCard(
                validUntil: '5.16.20',
                icon: Icons.shopping_bag,
                iconColor: AppColors.blue,
                title: 'First Purchase',
                description: '5% off for your next order',
                onApply: () {
                  Navigator.pop(context);
                  // Logique pour appliquer le coupon
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Coupon "First Purchase" appliqué')),
                  );
                },
              ),
              
              const SizedBox(height: 16),
              
              // Deuxième coupon
              _buildVoucherCard(
                validUntil: '6.20.20',
                icon: Icons.card_giftcard,
                iconColor: AppColors.blue,
                title: 'Gift From Customer Care',
                description: '15% off your next purchase',
                onApply: () {
                  Navigator.pop(context);
                  // Logique pour appliquer le coupon
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Coupon "Gift From Customer Care" appliqué')),
                  );
                },
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVoucherCard({
    required String validUntil,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required VoidCallback onApply,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // En-tête du coupon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Voucher',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F0F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Valid Until $validUntil',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Contenu du coupon
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionWithEdit({
    required String title,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubtitleText(
              text: title,
              color: Colors.black,
              textAlign: TextAlign.left,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildItemCard({
    required String itemImage,
    required String quantity,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(itemImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    quantity,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BodyText(
                  text: 'Lorem ipsum dolor sit amet consectetur.',
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          BoldText(
            text: price,
            fontSize: 18,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildShippingOption({
    required String title,
    required String days,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE7EAFF) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.blue : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.blue : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: title,
                  color: Colors.black,
                ),
                Text(
                  days,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            BoldText(
              text: price,
              color: price == 'FREE' ? AppColors.blue : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}