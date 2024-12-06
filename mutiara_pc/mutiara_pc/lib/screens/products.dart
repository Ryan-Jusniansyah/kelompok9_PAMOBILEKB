import 'package:flutter/material.dart';
import '../../screens/about_us.dart';
import '../screens/comment.dart';
import 'home.dart';
import '../products/categories/case.dart';
import '../products/categories/cpu.dart';
import '../products/categories/gpu.dart';
import '../products/categories/hdd.dart';
import '../products/categories/motherboard.dart';
import '../products/categories/ram.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  void _onNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CommentScreen()),
        );
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsScreen()),
        );
    }
  }

  void _navigateToCategory(BuildContext context, String category) {
    switch (category) {
      case 'CASE':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CaseScreen()),
        );
        break;
      case 'CPU':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CpuScreen()),
        );
        break;
      case 'GPU':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GpuScreen()),
        );
        break;
      case 'HDD':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HddScreen()),
        );
        break;
      case 'MOTHERBOARD':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MotherboardScreen()),
        );
        break;
      case 'RAM':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RamScreen()),
        );
        break;
    }
  }

  Widget _buildCategoryItem(BuildContext context, String category) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isDarkMode ? const Color(0xFF2A2A3E) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () => _navigateToCategory(context, category),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF1A1A2E) : Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 16,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  'CASE',
                  'CPU',
                  'GPU',
                  'HDD',
                  'MOTHERBOARD',
                  'RAM',
                ]
                    .map((category) => _buildCategoryItem(context, category))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer_sharp),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Comment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Us',
          ),
        ],
        currentIndex: 1,
        onTap: (index) => _onNavBarTap(context, index),
      ),
    );
  }
}
