import 'package:flutter/material.dart';

class RewardProgressScreen extends StatefulWidget {
  const RewardProgressScreen({super.key});

  @override
  State<RewardProgressScreen> createState() => _RewardProgressScreenState();
}

class _RewardProgressScreenState extends State<RewardProgressScreen> {
  bool _activeRewardsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTabBar(),
              const SizedBox(height: 24),
              Expanded(
                child: _activeRewardsSelected 
                  ? _buildActiveRewardsGrid() 
                  : _buildProgressContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: const Icon(Icons.person, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        const Text(
          'Vouchers',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.receipt_outlined, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: const Icon(Icons.view_list, color: Colors.black),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: const Icon(Icons.settings, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeRewardsSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _activeRewardsSelected 
                      ? Colors.white 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Active Rewards',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _activeRewardsSelected 
                          ? Colors.black 
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeRewardsSelected = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !_activeRewardsSelected 
                      ? Colors.white 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Progress',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: !_activeRewardsSelected 
                          ? Colors.black 
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveRewardsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildRewardCard(
          icon: Icons.shopping_bag,
          title: 'First Purchase',
          iconBackground: Colors.blue,
          hasCheckmark: true,
          progress: 1.0,
        ),
        _buildRewardCard(
          icon: Icons.favorite,
          title: 'Loyal Customer',
          iconBackground: Colors.blue,
          progress: 0.75,
        ),
        _buildRewardCard(
          icon: Icons.star,
          title: 'Review Maker',
          iconBackground: Colors.blue,
          progress: 0.5,
        ),
        _buildRewardCard(
          icon: Icons.cloud,
          title: 'Big Soul',
          iconBackground: Colors.white,
          progress: 0.0,
        ),
        _buildRewardCard(
          icon: Icons.shopping_cart_outlined,
          title: 'T-Shirt Collector',
          iconBackground: Colors.white,
          progress: 0.0,
        ),
        _buildRewardCard(
          icon: Icons.emoji_emotions,
          title: '10+ Orders',
          iconBackground: Colors.white,
          progress: 0.25,
        ),
      ],
    );
  }

  Widget _buildRewardCard({
    required IconData icon, 
    required String title, 
    required Color iconBackground,
    required double progress,
    bool hasCheckmark = false,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 3,
              ),
            ),
            CircleAvatar(
              radius: 28,
              backgroundColor: iconBackground,
              child: Icon(
                icon,
                color: iconBackground == Colors.white ? Colors.blue : Colors.white,
                size: 24,
              ),
            ),
            if (hasCheckmark)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        const Text(
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildProgressContent() {
    // À implémenter pour l'onglet Progress
    return const Center(
      child: Text('Contenu de progression à venir'),
    );
  }
}