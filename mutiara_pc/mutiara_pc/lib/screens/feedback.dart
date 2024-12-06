import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../screens/feedback_provider.dart';
import '../auth.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _auth = Auth();
  Map<String, dynamic>? userData;
  String selectedCategory = 'CPU';
  late String selectedProduct;
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _loadUserData() async {
    final data = await _auth.getCurrentUser();
    if (mounted && data != null) {
      setState(() {
        userData = data;
      });
    }
  }

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
    _loadUserData();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget buildProfileImage(bool isDarkMode) {
    return GestureDetector(
      onTap: () => _pickImage(isDarkMode),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: ClipOval(
          child: _buildImageWidget(isDarkMode),
        ),
      ),
    );
  }

  Widget _buildImageWidget(bool isDarkMode) {
    if (userData?['photoUrl'] != null) {
      return Image.asset(
        userData!['photoUrl'],
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildFallbackIcon(isDarkMode),
      );
    }
    return _buildFallbackIcon(isDarkMode);
  }

  Widget _buildFallbackIcon(bool isDarkMode) {
    return Icon(
      Icons.person,
      size: 40,
      color: isDarkMode ? Colors.grey[400] : Colors.grey,
    );
  }

  Future<void> _pickImage(bool isDarkMode) async {
    final photos = ['arif.jpg', 'genta.jpg', 'ryan.jpg', 'agsel.jpg'];

    final selectedPhoto = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose a profile picture'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profil/${photos[index]}'),
                ),
                title: Text(photos[index].split('.').first),
                onTap: () => Navigator.pop(context, photos[index]),
              );
            },
          ),
        ),
      ),
    );

    if (selectedPhoto != null) {
      setState(() {
        userData?['photoUrl'] = 'assets/images/profil/$selectedPhoto';
      });
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

        return Scaffold(
          backgroundColor: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 0,
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
                          'Submit Feedback',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: userData?['photoUrl'] != null
                                ? Image.asset(
                                    userData!['photoUrl'],
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                      Icons.person,
                                      size: 40,
                                      color: isDarkMode
                                          ? Colors.grey[400]
                                          : Colors.grey,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 40,
                                    color: isDarkMode
                                        ? Colors.grey[400]
                                        : Colors.grey,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        buildFeedbackForm(isDarkMode, imageWidth),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFeedbackForm(bool isDarkMode, double imageWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildNameInput(isDarkMode),
        const SizedBox(height: 16),
        buildDropdownField(
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
        buildDropdownField(
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
        buildProductPreview(isDarkMode, imageWidth),
        const SizedBox(height: 24),
        buildFeedbackInput(isDarkMode),
        const SizedBox(height: 24),
        buildSubmitButton(),
      ],
    );
  }

  Widget buildDropdownField(String label, String value, List<String> items,
      Function(String?) onChanged, bool isDarkMode) {
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? Colors.grey[900] : Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              dropdownColor: isDarkMode ? Colors.grey[900] : Colors.white,
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

  Widget buildProductPreview(bool isDarkMode, double imageWidth) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
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
                    color: isDarkMode ? Colors.grey[600] : Colors.grey,
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

  Widget buildFeedbackInput(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Feedback',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? Colors.grey[900] : Colors.white,
          ),
          child: TextField(
            controller: _feedbackController,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
              hintText: 'Write your feedback here...',
              hintStyle: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          if (_nameController.text.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter your name')),
            );
            return;
          }

          if (_feedbackController.text.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please write your feedback')),
            );
            return;
          }

          final feedback = FeedbackData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            userId: 'current_user_id',
            message: _feedbackController.text.trim(),
            timestamp: DateTime.now(),
            rating: 0,
            productCategory: selectedCategory,
            productName: selectedProduct,
            userImage: userData?['photoUrl'] ?? '',
            userName: _nameController.text.trim(),
          );

          Provider.of<FeedbackProvider>(context, listen: false)
              .addFeedback(feedback);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Feedback submitted successfully')),
          );

          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pop(context);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'SUBMIT',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildNameInput(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isDarkMode ? Colors.grey[900] : Colors.white,
          ),
          child: TextField(
            controller: _nameController,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
              hintText: 'Enter your name...',
              hintStyle: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
