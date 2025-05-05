import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  int _hours = 0;
  int _minutes = 36;
  int _seconds = 58;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            if (_hours > 0) {
              _hours--;
              _minutes = 59;
              _seconds = 59;
            } else {
              _timer.cancel();
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildProductGrid(),
        _buildSeeMoreButton(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.flash_on, color: Colors.red),
              CustomText(
                text: 'Flash Sale',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            children: [
              _buildTimeBox(_hours.toString().padLeft(2, '0')),
              _buildTimeSeparator(),
              _buildTimeBox(_minutes.toString().padLeft(2, '0')),
              _buildTimeSeparator(),
              _buildTimeBox(_seconds.toString().padLeft(2, '0')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String value) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.indigo.shade900,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomText(
        text: value,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTimeSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: CustomText(
        text: ':',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildProductItem(index);
      },
    );
  }

  Widget _buildProductItem(int index) {
    // Utilisation des images depuis ImageConstants
    final List<String> productImages = [
      ImageConstants.avatargirl,
      ImageConstants.clothing1,
      ImageConstants.clothing2,
      ImageConstants.shoes,
      ImageConstants.lingerie1,
      ImageConstants.lingerie2,
    ];

    // Couleurs de fond pour chaque produit
    final List<Color> backgroundColors = [
      Colors.pink.shade50,
      Colors.pink.shade100,
      Colors.amber.shade50,
      Colors.grey.shade100,
      Colors.pink.shade50,
      Colors.purple.shade50,
    ];

    return Stack(
      children: [
        // Produit
        Container(
          decoration: BoxDecoration(
            color: backgroundColors[index],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                productImages[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Badge de réduction
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const CustomText(
              text: '-20%',
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeeMoreButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.indigo.shade900,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                text: 'Voir plus',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: Colors.indigo.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}