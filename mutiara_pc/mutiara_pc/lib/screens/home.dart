import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'package:provider/provider.dart';
import 'products.dart';
import 'comment.dart';
import 'detector.dart';
import 'feedback.dart';
import '../../screens/about_us.dart';
import '../../mode/theme_provider.dart';
import '../../details/cpu/I310100.dart';
import '../../details/cpu/I511600K.dart';
import '../../details/cpu/I710700K.dart';
import '../../details/cpu/Ryzen33100.dart';
import '../../details/cpu/Ryzen55600X.dart';
import '../../details/cpu/Ryzen77700X.dart';
import '../../details/ram/AcerPredator.dart';
import '../../details/ram/CorsairVengeance.dart';
import '../../details/ram/KingstonHyperX.dart';
import '../../details/ram/AdataSpectrix.dart';
import '../../details/ram/TeamCreate.dart';
import '../../details/ram/VColorManta.dart';
import '../../details/motherboard/MSIB460.dart';
import '../../details/motherboard/AsusB560.dart';
import '../../details/motherboard/GigabyteZ490.dart';
import '../../details/motherboard/MSIB450.dart';
import '../../details/motherboard/AsusB550.dart';
import '../../details/motherboard/GigabyteX670E.dart';
import '../../details/gpu/GTX1660.dart';
import '../../details/gpu/RTX2060.dart';
import '../../details/gpu/RTX3050.dart';
import '../../details/gpu/RTX3080.dart';
import '../../details/gpu/RX580.dart';
import '../../details/gpu/RX6600XT.dart';
import '../../details/case/ASUSROGStrixHelios.dart';
import '../../details/case/CoolerMasterH500.dart';
import '../../details/case/Corsair680X.dart';
import '../../details/case/HYTEY60.dart';
import '../../details/case/LianLiO11.dart';
import '../../details/case/NZXTH9.dart';
import '../../details/hdd/SeagateBarracuda2TB.dart';
import '../../details/hdd/SeagateIronWolfPro20TB.dart';
import '../../details/hdd/SeagateSkyHawk1TB.dart';
import '../../details/hdd/ToshibaX300Performance10TB.dart';
import '../../details/hdd/WesternDigitalBlackPerformance250GB.dart';
import '../../details/hdd/WesternDigitalRedPlus4TB.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'login/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  final _auth = Auth();
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await _auth.getCurrentUser();
    if (mounted) {
      setState(() {
        userData = data;
      });
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    if (!mounted) return;

    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  void _handleEditProfile(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    ).then((_) {
      if (mounted) {
        _loadUserData();
      }
    });
  }

  final List<Map<String, dynamic>> categoryProducts = [
    {
      'category': 'Case',
      'products': [
        {
          'name': 'ASUS ROG Strix Helios',
          'image': 'assets/images/case/ASUSROGStrixHelios.png',
          'screen': const ASUSROGStrixHeliosDetail(),
        },
        {
          'name': 'Cooler Master H500',
          'image': 'assets/images/case/CoolerMasterMasterCaseH500.png',
          'screen': const CoolerMasterH500Detail(),
        },
        {
          'name': 'Corsair 680X RGB',
          'image': 'assets/images/case/CorsairCrystalSeries680XRGB.png',
          'screen': const Corsair680XDetail(),
        },
        {
          'name': 'HYTE Y60',
          'image': 'assets/images/case/HYTEY60.png',
          'screen': const HYTEY60Detail(),
        },
        {
          'name': 'Lian Li O11 Dynamic',
          'image': 'assets/images/case/LianLiO11Dynamic.png',
          'screen': const LianLiO11Detail(),
        },
        {
          'name': 'NZXT H9 Flow',
          'image': 'assets/images/case/NZXTH9Flow.png',
          'screen': const NZXTH9Detail(),
        },
      ]
    },
    {
      'category': 'CPU',
      'products': [
        {
          'name': 'Intel Core i3-10100',
          'image': 'assets/images/cpu/1310100.jpg',
          'screen': const I310100Detail(),
        },
        {
          'name': 'Intel Core i5-11600K',
          'image': 'assets/images/cpu/i511600k.jpg',
          'screen': const I511600KDetail(),
        },
        {
          'name': 'Intel Core i7-10700K',
          'image': 'assets/images/cpu/I710700K.jpg',
          'screen': const I710700KDetail(),
        },
        {
          'name': 'AMD Ryzen 3 3100',
          'image': 'assets/images/cpu/Ryzen33100.jpg',
          'screen': const Ryzen33100Detail(),
        },
        {
          'name': 'AMD Ryzen 5 5600X',
          'image': 'assets/images/cpu/Ryzen55600X.jpg',
          'screen': const Ryzen55600XDetail(),
        },
        {
          'name': 'AMD Ryzen 7 7700X',
          'image': 'assets/images/cpu/Ryzen77700X.jpg',
          'screen': const Ryzen77700XDetail(),
        },
      ]
    },
    {
      'category': 'GPU',
      'products': [
        {
          'name': 'GTX 1660',
          'image': 'assets/images/gpu/gtx1660.jpg',
          'screen': const GTX1660Detail(),
        },
        {
          'name': 'RTX 2060',
          'image': 'assets/images/gpu/rtx2060.jpg',
          'screen': const RTX2060Detail(),
        },
        {
          'name': 'RTX 3050',
          'image': 'assets/images/gpu/rtx3050.jpg',
          'screen': const RTX3050Detail(),
        },
        {
          'name': 'RTX 3080',
          'image': 'assets/images/gpu/rtx3080.jpg',
          'screen': const RTX3080Detail(),
        },
        {
          'name': 'RX 580',
          'image': 'assets/images/gpu/rx580.png',
          'screen': const RX580Detail(),
        },
        {
          'name': 'RX 6600 XT',
          'image': 'assets/images/gpu/rx6600xt.jpg',
          'screen': const RX6600XTDetail(),
        },
      ]
    },
    {
      'category': 'HDD',
      'products': [
        {
          'name': 'Seagate Barracuda 2TB',
          'image': 'assets/images/hdd/SeagateBarracuda2TB.png',
          'screen': const SeagateBarracudaDetail(),
        },
        {
          'name': 'Seagate IronWolf Pro 20TB',
          'image': 'assets/images/hdd/SeagateIronWolfPro20TB.png',
          'screen': const SeagateIronWolfPro20TBDetail(),
        },
        {
          'name': 'Seagate SkyHawk 1TB',
          'image': 'assets/images/hdd/SeagateSkyHawk1TB.png',
          'screen': const SeagateSkyHawk1TBDetail(),
        },
        {
          'name': 'Toshiba X300 10TB',
          'image': 'assets/images/hdd/ToshibaX300Performance10TB.png',
          'screen': const ToshibaX300Performance10TBDetail(),
        },
        {
          'name': 'WD Black 250GB',
          'image': 'assets/images/hdd/WesternDigitalBlackPerformance250GB.png',
          'screen': const WesternDigitalBlackPerformance250GBDetail(),
        },
        {
          'name': 'WD Red Plus 4TB',
          'image': 'assets/images/hdd/WesternDigitalRedPlus4TB.png',
          'screen': const WesternDigitalRedPlus4TBDetail(),
        },
      ]
    },
    {
      'category': 'Motherboard',
      'products': [
        {
          'name': 'MSI B460 Pro',
          'image': 'assets/images/motherboard/MSIB460.jpg',
          'screen': const MSIB460Detail(),
        },
        {
          'name': 'ASUS Tuf B560',
          'image': 'assets/images/motherboard/AsusB560.png',
          'screen': const AsusB560Detail(),
        },
        {
          'name': 'Gigabyte Z490',
          'image': 'assets/images/motherboard/GigabyteZ490.png',
          'screen': const GigabyteZ490Detail(),
        },
        {
          'name': 'MSI B450 Pro Max',
          'image': 'assets/images/motherboard/MSIB450.jpg',
          'screen': const MSIB450Detail(),
        },
        {
          'name': 'ASUS Rog B550',
          'image': 'assets/images/motherboard/AsusB550.png',
          'screen': const AsusB550Detail(),
        },
        {
          'name': 'Gigabyte X670E',
          'image': 'assets/images/motherboard/GigabyteX670E.jpg',
          'screen': const GigabyteX670EDetail(),
        },
      ]
    },
    {
      'category': 'RAM',
      'products': [
        {
          'name': 'Acer Predator RGB DDR5',
          'image': 'assets/images/ram/AcerPredator.jpg',
          'screen': const AcerPredatorDetail(),
        },
        {
          'name': 'Corsair Vengeance RGB',
          'image': 'assets/images/ram/CorsairVengeance.jpg',
          'screen': const CorsairVengeanceDetail(),
        },
        {
          'name': 'Kingston HyperX',
          'image': 'assets/images/ram/KingstonHyperX.jpg',
          'screen': const KingstonHyperXDetail(),
        },
        {
          'name': 'ADATA Spectrix D35G',
          'image': 'assets/images/ram/AdataSpectrix.jpg',
          'screen': const AdataSpectrixDetail(),
        },
        {
          'name': 'Team T-Create Expert',
          'image': 'assets/images/ram/TeamCreate.jpg',
          'screen': const TeamCreateDetail(),
        },
        {
          'name': 'V-Color Manta XSky',
          'image': 'assets/images/ram/VColorManta.jpg',
          'screen': const VColorMantaDetail(),
        },
      ]
    },
  ];

  void _onNavBarTap(int index) {
    switch (index) {
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductsScreen()));
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CommentScreen()));
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutUsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: isDarkMode ? Colors.black : Colors.blue,
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: userData?.containsKey('photoUrl') == true &&
                            userData!['photoUrl'] != null
                        ? Image.asset(
                            userData!['photoUrl'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: 30,
                                color:
                                    isDarkMode ? Colors.grey[700] : Colors.grey,
                              );
                            },
                          )
                        : Icon(
                            Icons.person,
                            size: 30,
                            color: isDarkMode ? Colors.grey[700] : Colors.grey,
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  userData?.containsKey('username') == true
                      ? userData!['username']
                      : 'Loading...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: const Icon(
                    Icons.feedback_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Submit Feedback',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Colors.white,
                  ),
                  title: Text(
                    isDarkMode ? 'Light Mode' : 'Dark Mode',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => _handleEditProfile(context),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () => _handleLogout(context),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetectorScreen(),
                              ),
                            );
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            onPressed: () {
                              _loadUserData();
                              Scaffold.of(context).openEndDrawer();
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductsScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: categoryProducts.asMap().entries.map((entry) {
                    final isSelected = selectedCategoryIndex == entry.key;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = entry.key;
                          });
                        },
                        child: LayoutBuilder(builder: (context, constraints) {
                          double screenWidth =
                              MediaQuery.of(context).size.width;
                          double horizontalPadding = screenWidth < 360 ? 8 : 12;

                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue
                                  : (isDarkMode
                                      ? const Color(0xFF2A2A3E)
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              entry.value['category'],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final products = categoryProducts[selectedCategoryIndex]
                        ['products'] as List;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          name: products[index]['name'],
                          imagePath: products[index]['image'],
                          screen: products[index]['screen'],
                          isDarkMode: isDarkMode,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
            label: 'comment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Us',
          ),
        ],
        currentIndex: 0,
        onTap: _onNavBarTap,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final Widget? screen;
  final bool isDarkMode;

  const ProductCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.isDarkMode,
    this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen!),
          );
        }
      },
      child: Card(
        elevation: 2,
        color: isDarkMode ? const Color(0xFF2A2A3E) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black : Colors.grey[100],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.computer,
                        size: 64,
                        color: isDarkMode ? Colors.grey[700] : Colors.grey,
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
