import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/utils/colors.dart';
import 'package:shoppe/core/constants/image_constants.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildPopularItems(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: 'Most Popular',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: () {
              // Navigation vers la page "Voir tout"
            },
            child: Row(
              children: [
                const CustomText(
                  text: 'See All',
                  color: AppColors.blue,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blue,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItems() {
    // Liste des articles populaires à afficher
    final List<Map<String, dynamic>> popularItems = [
      {
        'image': ImageConstants.clothing1,
        'price': '1780',
        'tag': 'New',
        'color': Colors.green,
      },
      {
        'image': ImageConstants.clothing2,
        'price': '1780',
        'tag': 'Sale',
        'color': Colors.grey,
      },
      {
        'image': ImageConstants.clothing,
        'price': '1780',
        'tag': 'Hot',
        'color': Colors.yellow,
      },
      {
        'image': ImageConstants.shoes1,
        'price': '1780',
        'tag': '',
        'color': Colors.transparent,
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: popularItems.length,
        itemBuilder: (context, index) {
          final item = popularItems[index];
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (item['tag'].isNotEmpty)
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: item['tag'],
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CustomText(
                      text: item['price'],
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}