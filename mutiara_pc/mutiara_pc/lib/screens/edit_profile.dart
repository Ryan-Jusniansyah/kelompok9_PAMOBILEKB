import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mode/theme_provider.dart';
import '../auth.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final _auth = Auth();
  Map<String, dynamic>? userData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await _auth.getCurrentUser();
    if (mounted && data != null) {
      setState(() {
        userData = data;
        _usernameController.text = data['username'];
      });
    }
  }

  Future<void> _pickImage() async {
    final photos = ['arif.jpg', 'genta.jpg', 'ryan.jpg', 'agsel.jpg'];

    showDialog(
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
                onTap: () {
                  setState(() {
                    userData?['photoUrl'] =
                        'assets/images/profil/${photos[index]}';
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    setState(() => _isLoading = true);
    try {
      await _auth.updateProfile(
          _usernameController.text, userData?['photoUrl']);
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildProfileImage(bool isDarkMode) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
              color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            ),
            child: ClipOval(
              child: _buildImageWidget(isDarkMode),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWidget(bool isDarkMode) {
    if (userData?.containsKey('photoUrl') == true &&
        userData!['photoUrl'] != null) {
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
      size: 60,
      color: isDarkMode ? Colors.grey[400] : Colors.grey,
    );
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildProfileImage(isDarkMode),
                    const SizedBox(height: 24),
                    Text(
                      userData?['username'] ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _usernameController,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: 'New Username',
                        labelStyle: TextStyle(
                          color:
                              isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: isDarkMode
                                ? Colors.grey[700]!
                                : Colors.grey[300]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _updateProfile,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor:
                              isDarkMode ? Colors.grey[700] : Colors.grey[300],
                        ),
                        child: _isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              )
                            : const Text(
                                'Save Changes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
