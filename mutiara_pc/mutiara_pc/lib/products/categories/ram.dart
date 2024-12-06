import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';
import '../../details/ram/AcerPredator.dart';
import '../../details/ram/CorsairVengeance.dart';
import '../../details/ram/KingstonHyperX.dart';
import '../../details/ram/AdataSpectrix.dart';
import '../../details/ram/TeamCreate.dart';
import '../../details/ram/VColorManta.dart';

class RamScreen extends StatelessWidget {
  const RamScreen({super.key});

  final List<Map<String, dynamic>> ramModels = const [
    {
      "name": "Acer Predator Vesta II RGB DDR5 32GB",
      "model": "DDR5 6000MHz",
      "screen": AcerPredatorDetail(),
      "image": "assets/images/ram/AcerPredator.jpg"
    },
    {
      "name": "Corsair Vengeance RGB PRO 32GB",
      "model": "DDR4 3600MHz",
      "screen": CorsairVengeanceDetail(),
      "image": "assets/images/ram/CorsairVengeance.jpg"
    },
    {
      "name": "Kingston HyperX Fury 8GB",
      "model": "DDR4 2666MHz",
      "screen": KingstonHyperXDetail(),
      "image": "assets/images/ram/KingstonHyperX.jpg"
    },
    {
      "name": "ADATA Spectrix D35G RGB 16GB",
      "model": "DDR4 3200MHz",
      "screen": AdataSpectrixDetail(),
      "image": "assets/images/ram/AdataSpectrix.jpg"
    },
    {
      "name": "Team T-Create Expert DDR5 64GB",
      "model": "DDR5 6400MHz",
      "screen": TeamCreateDetail(),
      "image": "assets/images/ram/TeamCreate.jpg"
    },
    {
      "name": "V-Color Manta XSky Black 32GB",
      "model": "DDR5 6000MHz",
      "screen": VColorMantaDetail(),
      "image": "assets/images/ram/VColorManta.jpg"
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
                          'RAM',
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
                    itemCount: ramModels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToDetail(
                          context,
                          ramModels[index]["screen"],
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
                                      ramModels[index]["image"],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.memory,
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
                                      ramModels[index]["name"]!,
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
                                      ramModels[index]["model"]!,
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
