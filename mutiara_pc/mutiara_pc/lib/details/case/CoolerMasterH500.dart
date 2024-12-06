import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';

class CoolerMasterH500Detail extends StatelessWidget {
  const CoolerMasterH500Detail({super.key});

  void _onNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductsScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CommentScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;
        final cardColor = isDarkMode ? const Color(0xFF2A2A3E) : Colors.white;
        final textColor = isDarkMode ? Colors.white : Colors.black;
        final shadowColor = isDarkMode ? Colors.black26 : Colors.grey.shade200;

        return Scaffold(
          backgroundColor:
              isDarkMode ? const Color(0xFF1A1A2E) : Colors.grey[100],
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context, isDarkMode, textColor),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProductCard(
                            isDarkMode: isDarkMode,
                            cardColor: cardColor,
                            textColor: textColor,
                            shadowColor: shadowColor,
                          ),
                          const SizedBox(height: 16),
                          _buildSpecificationsCard(
                            isDarkMode: isDarkMode,
                            cardColor: cardColor,
                            shadowColor: shadowColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavBar(context, isDarkMode),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDarkMode, Color textColor) {
    return Container(
      color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: textColor),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Center(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required bool isDarkMode,
    required Color cardColor,
    required Color textColor,
    required Color shadowColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Container(
                  width: constraints.maxWidth * 0.8,
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: Image.asset(
                    'assets/images/case/CoolerMasterMasterCaseH500.png',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Cooler Master MasterCase H500',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsCard({
    required bool isDarkMode,
    required Color cardColor,
    required Color shadowColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpecificationItem('Form Factor: ', 'Mid Tower',
              isDarkMode: isDarkMode),
          SpecificationItem(
            'Motherboard Support: ',
            'Mini-ITX, Micro-ATX, ATX, E-ATX (up to 12" x 10.7")',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Dimensions: ',
            '544 x 242 x 519mm (L x W x H)',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Material: ',
            'Steel, Plastic, Tempered Glass',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Front I/O Ports: ',
            '2x USB 3.0, 1x USB 2.0, 1x Audio In/Out (HD Audio)',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Drive Bays: ',
            '2x 3.5" (or 2.5"), 2x 2.5"',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Cooling Support: ',
            'Front: 2x 200mm ARGB Fans (pre-installed) or 3x 120mm/140mm, Top: 2x 120/140mm, Rear: 1x 120mm (pre-installed)',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'GPU Length Support: ',
            'Up to 410mm',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'CPU Cooler Height: ',
            'Up to 167mm',
            isDarkMode: isDarkMode,
          ),
          SpecificationItem(
            'Special Features: ',
            'Dual 200mm ARGB Fans, Mesh & Acrylic Front Panel Options, PSU Cover, Cable Management System',
            isDarkMode: isDarkMode,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, bool isDarkMode) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
      currentIndex: 1,
      onTap: (index) => _onNavBarTap(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.computer_sharp),
          label: 'Products',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Comment'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About Us'),
      ],
    );
  }
}

class SpecificationItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isDarkMode;

  const SpecificationItem(
    this.label,
    this.value, {
    required this.isDarkMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.grey[300] : Colors.grey[800];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
