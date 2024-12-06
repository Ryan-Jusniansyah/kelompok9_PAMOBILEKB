import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';
import '../../details/cpu/I310100.dart';
import '../../details/cpu/I511600K.dart';
import '../../details/cpu/I710700K.dart';
import '../../details/cpu/Ryzen33100.dart';
import '../../details/cpu/Ryzen55600X.dart';
import '../../details/cpu/Ryzen77700X.dart';

class CpuScreen extends StatelessWidget {
  const CpuScreen({super.key});

  final List<Map<String, dynamic>> cpuModels = const [
    {
      "name": "Intel Core i3-10100",
      "model": "I3 10100",
      "screen": I310100Detail(),
      "image": "assets/images/cpu/1310100.jpg",
    },
    {
      "name": "Intel Core i5-11600K",
      "model": "I5 11600K",
      "screen": I511600KDetail(),
      "image": "assets/images/cpu/i511600k.jpg",
    },
    {
      "name": "Intel Core i7-10700K",
      "model": "I7 10700K",
      "screen": I710700KDetail(),
      "image": "assets/images/cpu/I710700K.jpg",
    },
    {
      "name": "AMD Ryzen 3 3100",
      "model": "Ryzen 3 3100",
      "screen": Ryzen33100Detail(),
      "image": "assets/images/cpu/Ryzen33100.jpg",
    },
    {
      "name": "AMD Ryzen 5 5600X",
      "model": "Ryzen 5 5600X",
      "screen": Ryzen55600XDetail(),
      "image": "assets/images/cpu/Ryzen55600X.jpg",
    },
    {
      "name": "AMD Ryzen 7 7700X",
      "model": "Ryzen 7 7700X",
      "screen": Ryzen77700XDetail(),
      "image": "assets/images/cpu/Ryzen77700X.jpg",
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
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Center(
                        child: Text(
                          'CPU',
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
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: cpuModels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToDetail(
                          context,
                          cpuModels[index]["screen"],
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
                                      cpuModels[index]["image"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  cpuModels[index]["name"]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
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
