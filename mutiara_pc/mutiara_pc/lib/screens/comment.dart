import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../../screens/feedback_provider.dart';
import 'products.dart';
import 'home.dart';
import '../../screens/about_us.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String selectedCategory = 'CPU';
  late String selectedProduct;

  final Map<String, List<String>> productCategories = const {
    'CPU': [
      'Intel Core i3-10100',
      'Intel Core i5-11600K',
      'Intel Core i7-10700K',
      'AMD Ryzen 3 3100',
      'AMD Ryzen 5 5600X',
      'AMD Ryzen 7 7700X',
    ],
    'GPU': [
      'GTX 1660',
      'RTX 2060',
      'RTX 3050',
      'RTX 3080',
      'RX 580',
      'RX 6600 XT',
    ],
    'Motherboard': [
      'ASUS Rog B550',
      'ASUS Tuf B560',
      'Gigabyte X670E',
      'Gigabyte Z490',
      'MSI B450 Pro Max',
      'MSI B460 Pro',
    ],
    'RAM': [
      'Acer Predator Vesta II RGB DDR5 32GB',
      'ADATA Spectrix D35G RGB 16GB',
      'Corsair Vengeance RGB PRO 32GB',
      'Kingston HyperX Fury 8GB',
      'Team T-Create Expert DDR5 64GB',
      'V-Color Manta XSky Black 32GB',
    ],
    'HDD': [
      'Seagate Barracuda 2TB',
      'Seagate IronWolf Pro 20TB',
      'Seagate SkyHawk 1TB',
      'Toshiba X300 10TB',
      'WD Black 250GB',
      'WD Red Plus 4TB',
    ],
    'Case': [
      'ASUS ROG Strix Helios',
      'Cooler Master H500',
      'Corsair 680X RGB',
      'HYTE Y60',
      'Lian Li O11 Dynamic',
      'NZXT H9 Flow',
    ],
  };

  final Map<String, String> _defaultImages = const {
    'CPU': 'assets/images/cpu/1310100.jpg',
    'GPU': 'assets/images/gpu/gtx1660.jpg',
    'Motherboard': 'assets/images/motherboard/MSIB460.jpg',
    'RAM': 'assets/images/ram/AcerPredator.jpg',
    'HDD': 'assets/images/hdd.png',
    'Case': 'assets/images/case.png',
  };

  final Map<String, Map<String, String>> _productImages = const {
    'CPU': {
      'Intel Core i3-10100': 'assets/images/cpu/1310100.jpg',
      'Intel Core i5-11600K': 'assets/images/cpu/i511600k.jpg',
      'Intel Core i7-10700K': 'assets/images/cpu/I710700K.jpg',
      'AMD Ryzen 3 3100': 'assets/images/cpu/Ryzen33100.jpg',
      'AMD Ryzen 5 5600X': 'assets/images/cpu/Ryzen55600X.jpg',
      'AMD Ryzen 7 7700X': 'assets/images/cpu/Ryzen77700X.jpg',
    },
    'GPU': {
      'GTX 1660': 'assets/images/gpu/gtx1660.jpg',
      'RTX 2060': 'assets/images/gpu/rtx2060.jpg',
      'RTX 3050': 'assets/images/gpu/rtx3050.jpg',
      'RTX 3080': 'assets/images/gpu/rtx3080.jpg',
      'RX 580': 'assets/images/gpu/rx580.png',
      'RX 6600 XT': 'assets/images/gpu/rx6600xt.jpg',
    },
    'Motherboard': {
      'ASUS Rog B550': 'assets/images/motherboard/AsusB550.png',
      'ASUS Tuf B560': 'assets/images/motherboard/AsusB560.png',
      'Gigabyte X670E': 'assets/images/motherboard/GigabyteX670E.jpg',
      'Gigabyte Z490': 'assets/images/motherboard/GigabyteZ490.png',
      'MSI B450 Pro Max': 'assets/images/motherboard/MSIB450.jpg',
      'MSI B460 Pro': 'assets/images/motherboard/MSIB460.jpg',
    },
    'RAM': {
      'Acer Predator Vesta II RGB DDR5 32GB':
          'assets/images/ram/AcerPredator.jpg',
      'ADATA Spectrix D35G RGB 16GB': 'assets/images/ram/AdataSpectrix.jpg',
      'Corsair Vengeance RGB PRO 32GB':
          'assets/images/ram/CorsairVengeance.jpg',
      'Kingston HyperX Fury 8GB': 'assets/images/ram/KingstonHyperX.jpg',
      'Team T-Create Expert DDR5 64GB': 'assets/images/ram/TeamCreate.jpg',
      'V-Color Manta XSky Black 32GB': 'assets/images/ram/VColorManta.jpg',
    },
    'Case': {
      'ASUS ROG Strix Helios': 'assets/images/case/ASUSROGStrixHelios.png',
      'Cooler Master H500': 'assets/images/case/CoolerMasterMasterCaseH500.png',
      'Corsair 680X RGB': 'assets/images/case/CorsairCrystalSeries680XRGB.png',
      'HYTE Y60': 'assets/images/case/HYTEY60.png',
      'Lian Li O11 Dynamic': 'assets/images/case/LianLiO11Dynamic.png',
      'NZXT H9 Flow': 'assets/images/case/NZXTH9Flow.png',
    },
    'HDD': {
      'Seagate Barracuda 2TB': 'assets/images/hdd/SeagateBarracuda2TB.png',
      'Seagate IronWolf Pro 20TB':
          'assets/images/hdd/SeagateIronWolfPro20TB.png',
      'Seagate SkyHawk 1TB': 'assets/images/hdd/SeagateSkyHawk1TB.png',
      'Toshiba X300 10TB': 'assets/images/hdd/ToshibaX300Performance10TB.png',
      'WD Black 250GB':
          'assets/images/hdd/WesternDigitalBlackPerformance250GB.png',
      'WD Red Plus 4TB': 'assets/images/hdd/WesternDigitalRedPlus4TB.png',
    },
  };

  @override
  void initState() {
    super.initState();
    selectedProduct = productCategories[selectedCategory]![0];
  }

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
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsScreen()),
        );
    }
  }

  String _getImagePath() {
    if (_productImages.containsKey(selectedCategory) &&
        _productImages[selectedCategory]!.containsKey(selectedProduct)) {
      return _productImages[selectedCategory]![selectedProduct]!;
    }
    return _defaultImages[selectedCategory] ?? 'assets/images/default.png';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;
        final screenWidth = MediaQuery.of(context).size.width;
        final imageWidth = screenWidth * 0.7 > 300 ? 300.0 : screenWidth * 0.7;

        return Theme(
          data: isDarkMode ? themeProvider.darkTheme : themeProvider.lightTheme,
          child: Scaffold(
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
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Feedback',
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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDropdownField(
                            'Product Category',
                            selectedCategory,
                            productCategories.keys.toList(),
                            (value) {
                              setState(() {
                                selectedCategory = value!;
                                selectedProduct = productCategories[value]![0];
                              });
                            },
                            isDarkMode,
                          ),
                          const SizedBox(height: 16),
                          _buildDropdownField(
                            'Product Name',
                            selectedProduct,
                            productCategories[selectedCategory]!,
                            (value) {
                              setState(() {
                                selectedProduct = value!;
                              });
                            },
                            isDarkMode,
                          ),
                          const SizedBox(height: 24),
                          _buildProductPreview(isDarkMode, imageWidth),
                          const SizedBox(height: 24),
                          ..._buildComments(isDarkMode),
                        ],
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
              currentIndex: 2,
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
              onTap: (index) => _onNavBarTap(context, index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDropdownField(
    String label,
    String value,
    List<String> items,
    Function(String?) onChanged,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              dropdownColor:
                  isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductPreview(bool isDarkMode, double imageWidth) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2A2A3E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black26 : Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: imageWidth,
            height: imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                _getImagePath(),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: imageWidth * 0.5,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            selectedProduct,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildComments(bool isDarkMode) {
    final provider = Provider.of<FeedbackProvider>(context, listen: true);
    final feedbacks =
        provider.getFeedbacksByProduct(selectedCategory, selectedProduct);

    if (feedbacks.isEmpty) {
      return [
        Center(
          child: Text(
            'No feedback yet for this product',
            style: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
      ];
    }

    return feedbacks.map((feedback) {
      return _buildCommentItem(
        feedback.userName,
        feedback.message,
        feedback.userImage,
        isDarkMode,
      );
    }).toList();
  }

  Widget _buildCommentItem(
      String name, String comment, String imagePath, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
