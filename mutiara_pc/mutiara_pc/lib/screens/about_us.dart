import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import 'products.dart';
import 'comment.dart';
import 'home.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  void _onNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Theme(
          data: isDarkMode ? themeProvider.darkTheme : themeProvider.lightTheme,
          child: Scaffold(
            backgroundColor:
                isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
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
                            'About Us',
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
                          children: [
                            const SizedBox(height: 20),
                            Image.asset(
                              'assets/images/any/d.png',
                              height: 200,
                            ),
                            const SizedBox(height: 40),
                            Text(
                              'This PC component classification mobile application',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'was created by four informatics students at Mulawarman University,\nwho aimed to complete the final project of the\nmobile device programming course,',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'and below are the names of the developers of this application:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: isDarkMode
                                    ? const Color(0xFF2A2A3E)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: isDarkMode
                                        ? Colors.black12
                                        : Colors.grey.shade200,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  _buildDeveloperInfo(
                                      '2209106009 - Muhammad Arif Rachman',
                                      isDarkMode),
                                  _buildDeveloperInfo(
                                      '2209106022 - Rafly Genta Pratama',
                                      isDarkMode),
                                  _buildDeveloperInfo(
                                      '2209106026 - Ryan Jusniansyah',
                                      isDarkMode),
                                  _buildDeveloperInfo(
                                      '2209106046 - Agsel Falana Suparlan Putra',
                                      isDarkMode),
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
              currentIndex: 3,
              onTap: (index) => _onNavBarTap(context, index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeveloperInfo(String text, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
