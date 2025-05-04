import 'package:flutter/material.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Categories',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const CustomText(
                      text: 'See All',
                      color: AppColors.blue,
                      fontSize: 16,
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blue,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildCategoryGrid(),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildCategoryItem('Clothing', ImageConstants.clothing, ImageConstants.clothing1, ImageConstants.clothing2, 109),
              const SizedBox(width: 15),
              _buildCategoryItem('Shoes', ImageConstants.shoes, ImageConstants.shoes1, ImageConstants.shoes2, 530),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildCategoryItem('Bags', ImageConstants.clothing2, ImageConstants.clothing1, ImageConstants.clothing, 87),
              const SizedBox(width: 15),
              _buildCategoryItem('Lingerie', ImageConstants.lingerie, ImageConstants.lingerie1, ImageConstants.lingerie2, 218),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String image1, String image2, String image3, int count) {
    return Expanded(
      child: Container(
        height: 200,
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
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    _buildGridImage(image1),
                    _buildGridImage(image2),
                    _buildGridImage(image3),
                    _buildGridImage(image1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 8),
                  CustomText(
                    text: count.toString(),
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}