import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';

class SpecificationItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isDarkMode;

  const SpecificationItem(this.label, this.value,
      {required this.isDarkMode, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
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

class Ryzen33100Detail extends StatelessWidget {
  const Ryzen33100Detail({super.key});

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

        return Scaffold(
          backgroundColor:
              isDarkMode ? const Color(0xFF1A1A2E) : Colors.grey[100],
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
                          'Details',
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xFF2A2A3E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: isDarkMode
                                      ? Colors.black26
                                      : Colors.grey.shade200,
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
                                        constraints: const BoxConstraints(
                                          maxHeight: 200,
                                        ),
                                        child: Image.asset(
                                          'assets/images/cpu/Ryzen33100.jpg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'AMD Ryzen 3 3100',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xFF2A2A3E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: isDarkMode
                                      ? Colors.black26
                                      : Colors.grey.shade200,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SpecificationItem(
                                  'Processor Family: ',
                                  'AMD Ryzen 3 (Zen 2)',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Total Cores: ',
                                  '4',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Total Threads: ',
                                  '8',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Base Clock Speed: ',
                                  '3.6 GHz',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Max Boost Frequency: ',
                                  '3.9 GHz',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Cache: ',
                                  'L2: 2MB, L3: 16MB',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'TDP: ',
                                  '65W',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Memory Support: ',
                                  'DDR4-3200',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Socket: ',
                                  'AM4',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Integrated Graphics: ',
                                  'No',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'Technology: ',
                                  '7nm',
                                  isDarkMode: isDarkMode,
                                ),
                                SpecificationItem(
                                  'PCIe Version: ',
                                  'PCIe 4.0',
                                  isDarkMode: isDarkMode,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor:
                isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
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
      },
    );
  }
}
