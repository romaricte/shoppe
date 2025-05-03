import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoppe/common/widgets/custom_text.dart';
import 'package:shoppe/core/constants/image_constants.dart';
import 'package:shoppe/core/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildAnnouncement(),
              _buildRecentlyViewed(),
              _buildMyOrders(),
              _buildStories(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(ImageConstants.avatargirl),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const CustomText(
              text: 'My Activity',
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.scanner_rounded, color: AppColors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu_open_sharp, color: AppColors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncement() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Announcement',
                 
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  
                ),
                const CustomText(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.blue,
            ),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyViewed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomText(
            text: 'Recently viewed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              String viewedImage = ImageConstants.viewed1;
              if (index == 1) {
                viewedImage = ImageConstants.viewed2;
              } else if (index == 2) {
                viewedImage = ImageConstants.viewed3;
              } else if (index == 3) {
                viewedImage = ImageConstants.viewed4;
              } else if (index == 4) {
                viewedImage = ImageConstants.viewed5;
              }
              
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage(viewedImage),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMyOrders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomText(
            text: 'My Orders',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOrderButton('To Pay', Icons.payment),
            _buildOrderButton('To Receive', Icons.local_shipping),
            _buildOrderButton('To Review', Icons.rate_review),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.blue),
          const SizedBox(width: 8),
          CustomText(text: text, color: AppColors.blue),
        ],
      ),
    );
  }

  Widget _buildStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomText(
            text: 'Stories',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}