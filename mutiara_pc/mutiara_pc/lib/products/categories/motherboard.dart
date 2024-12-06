import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';
import '../../details/motherboard/MSIB460.dart';
import '../../details/motherboard/AsusB560.dart';
import '../../details/motherboard/GigabyteZ490.dart';
import '../../details/motherboard/MSIB450.dart';
import '../../details/motherboard/AsusB550.dart';
import '../../details/motherboard/GigabyteX670E.dart';

class MotherboardScreen extends StatelessWidget {
  const MotherboardScreen({super.key});

  final List<Map<String, dynamic>> motherboardModels = const [
    {
      "name": "MSI MPG B460 GAMING PLUS",
      "chipset": "Intel B460",
      "socket": "LGA 1200",
      "screen": MSIB460Detail(),
      "image": "assets/images/motherboard/MSIB460.jpg"
    },
    {
      "name": "ASUS ROG STRIX B560-A GAMING",
      "chipset": "Intel B560",
      "socket": "LGA 1200",
      "screen": AsusB560Detail(),
      "image": "assets/images/motherboard/AsusB560.png"
    },
    {
      "name": "GIGABYTE Z490 AORUS PRO AX",
      "chipset": "Intel Z490",
      "socket": "LGA 1200",
      "screen": GigabyteZ490Detail(),
      "image": "assets/images/motherboard/GigabyteZ490.png"
    },
    {
      "name": "MSI B450 TOMAHAWK MAX",
      "chipset": "AMD B450",
      "socket": "AM4",
      "screen": MSIB450Detail(),
      "image": "assets/images/motherboard/MSIB450.jpg"
    },
    {
      "name": "ASUS TUF GAMING B550-PLUS",
      "chipset": "AMD B550",
      "socket": "AM4",
      "screen": AsusB550Detail(),
      "image": "assets/images/motherboard/AsusB550.png"
    },
    {
      "name": "GIGABYTE X670E AORUS MASTER",
      "chipset": "AMD X670E",
      "socket": "AM5",
      "screen": GigabyteX670EDetail(),
      "image": "assets/images/motherboard/GigabyteX670E.jpg"
    },
  ];

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

  void _navigateToDetail(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
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
                          'Motherboard',
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
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: motherboardModels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToDetail(
                          context,
                          motherboardModels[index]["screen"],
                        ),
                        child: Card(
                          elevation: isDarkMode ? 2 : 1,
                          color: isDarkMode
                              ? const Color(0xFF2A2A3E)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? Colors.black
                                        : Colors.grey[100],
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                    child: Image.asset(
                                      motherboardModels[index]["image"],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.computer,
                                          size: 64,
                                          color: isDarkMode
                                              ? Colors.grey[400]
                                              : Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      motherboardModels[index]["name"]!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${motherboardModels[index]["chipset"]} - ${motherboardModels[index]["socket"]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isDarkMode
                                            ? Colors.grey[400]
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
