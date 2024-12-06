import 'package:flutter/material.dart';
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

class AsusB550Detail extends StatelessWidget {
  const AsusB550Detail({super.key});

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                                      'assets/images/motherboard/AsusB550.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'ASUS ROG STRIX B550-F GAMING',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
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
                              'CPU Support: ',
                              'AMD AM4 Socket for AMD Ryzen 5000 Series, 4000 G-Series, 3000 Series, 3000 G-Series, 2000 Series and 2000 G-Series Desktop Processors',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Socket: ',
                              'AM4',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Chipset: ',
                              'AMD B550',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Memory Support: ',
                              'DDR4, 4x DIMM, Max 128GB',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Memory Speed: ',
                              'Up to 5100MHz (OC)',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'PCIe Slots: ',
                              '1x PCIe 4.0 x16, 1x PCIe 3.0 x16 (x4), 3x PCIe 3.0 x1',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Storage: ',
                              '6x SATA 6Gb/s, 2x M.2 slots (1x PCIe 4.0 x4, 1x PCIe 3.0 x4)',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'USB Ports: ',
                              'Rear: 2x USB 3.2 Gen 2, 4x USB 3.2 Gen 1, 2x USB 2.0\nInternal: 3x USB 3.2 Gen 1, 4x USB 2.0',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Network: ',
                              'Intel 2.5Gb Ethernet with ASUS LANGuard',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Audio: ',
                              'ROG SupremeFX S1220A 7.1 Surround Sound High Definition Audio CODEC',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Form Factor: ',
                              'ATX',
                              isDarkMode: isDarkMode,
                            ),
                            SpecificationItem(
                              'Special Features: ',
                              'ASUS Aura Sync RGB, AI Networking, AI Cooling, Pre-mounted I/O Shield',
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
