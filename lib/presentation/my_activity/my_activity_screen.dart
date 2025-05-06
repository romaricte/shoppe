import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/routes/app_routes.dart';
class MyActivityScreen extends StatefulWidget {
  const MyActivityScreen({super.key});

  @override
  State<MyActivityScreen> createState() => _MyActivityScreenState();
}

class _MyActivityScreenState extends State<MyActivityScreen> {
  final String currentMonth = 'April';
  final double totalAmount = 365.00;
  
  // Catégories de dépenses avec leurs montants
  final Map<String, double> categories = {
    'Clothing': 183.00,
    'Lingerie': 92.00,
    'Shoes': 47.00,
    'Bags': 43.00,
  };
  
  // Statistiques des commandes
  final int orderedCount = 12;
  final int receivedCount = 7;
  final int toReceiveCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildMonthSelector(),
              const SizedBox(height: 24),
              _buildSpendingChart(),
              const SizedBox(height: 24),
              _buildCategoryChips(),
              const SizedBox(height: 30),
              _buildOrderStats(),
              const Spacer(),
              _buildOrderHistoryButton(),
              const SizedBox(height: 16),
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
          backgroundColor: Colors.pink[100],
          child: const Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'My Activity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(Icons.calendar_month_outlined, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.menu, color: Colors.blue),
            ),
            Positioned(
              top: 0,
              right: 0,
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
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.settings, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.blue),
            onPressed: () {},
          ),
          Text(
            currentMonth,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingChart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 220,
          height: 220,
          child: CustomPaint(
            painter: SpendingChartPainter(categories),
            child: Container(),
          ),
        ),
        Column(
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '\$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.entries.map((entry) {
        Color chipColor;
        
        switch (entry.key) {
          case 'Clothing':
            chipColor = Colors.blue;
            break;
          case 'Lingerie':
            chipColor = Colors.lightGreen;
            break;
          case 'Shoes':
            chipColor = Colors.orange;
            break;
          case 'Bags':
            chipColor = Colors.pink;
            break;
          default:
            chipColor = Colors.grey;
        }
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: chipColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            '${entry.key} \$${entry.value.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOrderStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(orderedCount, 'Ordered'),
        _buildStatItem(receivedCount, 'Recieved'),
        _buildStatItem(toReceiveCount, 'To Recieve'),
      ],
    );
  }

  Widget _buildStatItem(int count, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderHistoryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.ordersScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Order History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SpendingChartPainter extends CustomPainter {
  final Map<String, double> categories;
  
  SpendingChartPainter(this.categories);
  
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.2;
    final strokeWidth = 24.0;
    
    // Calcul du total
    final total = categories.values.fold(0.0, (sum, value) => sum + value);
    
    // Définition des couleurs pour chaque catégorie
    final colors = {
      'Clothing': Colors.blue,
      'Lingerie': Colors.lightGreen,
      'Shoes': Colors.orange,
      'Bags': Colors.pink,
    };
    
    // Dessiner le fond gris clair du cercle
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    
    canvas.drawCircle(center, radius, backgroundPaint);
    
    // Dessiner les segments pour chaque catégorie
    double startAngle = -1.5708; // Commence à midi (-90 degrés en radians)
    
    categories.forEach((category, amount) {
      final sweepAngle = (amount / total) * 6.2832; // 2*PI radians
      
      final paint = Paint()
        ..color = colors[category] ?? Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      
      // Petit ajustement pour éviter que les extrémités arrondies ne se chevauchent
      final adjustedSweepAngle = sweepAngle > 0 ? sweepAngle - 0.03 : 0.0;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        adjustedSweepAngle,
        false,
        paint,
      );
      
      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}