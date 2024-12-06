import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/comment.dart';
import '../../screens/products.dart';
import '../../screens/about_us.dart';
import '../../details/hdd/SeagateBarracuda2TB.dart';
import '../../details/hdd/SeagateIronWolfPro20TB.dart';
import '../../details/hdd/SeagateSkyHawk1TB.dart';
import '../../details/hdd/ToshibaX300Performance10TB.dart';
import '../../details/hdd/WesternDigitalBlackPerformance250GB.dart';
import '../../details/hdd/WesternDigitalRedPlus4TB.dart';

class HddScreen extends StatelessWidget {
  const HddScreen({super.key});

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

  final List<Map<String, dynamic>> hddItems = const [
    {
      'image': 'assets/images/hdd/SeagateBarracuda2TB.png',
      'name': 'Seagate Barracuda 2TB',
      'route': SeagateBarracudaDetail(),
    },
    {
      'image': 'assets/images/hdd/SeagateIronWolfPro20TB.png',
      'name': 'Seagate IronWolf Pro 20TB',
      'route': SeagateIronWolfPro20TBDetail(),
    },
    {
      'image': 'assets/images/hdd/SeagateSkyHawk1TB.png',
      'name': 'Seagate SkyHawk 1TB',
      'route': SeagateSkyHawk1TBDetail(),
    },
    {
      'image': 'assets/images/hdd/ToshibaX300Performance10TB.png',
      'name': 'Toshiba X300 10TB',
      'route': ToshibaX300Performance10TBDetail(),
    },
    {
      'image': 'assets/images/hdd/WesternDigitalBlackPerformance250GB.png',
      'name': 'WD Black 250GB',
      'route': WesternDigitalBlackPerformance250GBDetail(),
    },
    {
      'image': 'assets/images/hdd/WesternDigitalRedPlus4TB.png',
      'name': 'WD Red Plus 4TB',
      'route': WesternDigitalRedPlus4TBDetail(),
    },
  ];

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
                          'HDD',
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
                    itemCount: hddItems.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hddItems[index]['route'],
                            ),
                          );
                        },
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
                                      hddItems[index]['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  hddItems[index]['name']!,
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
