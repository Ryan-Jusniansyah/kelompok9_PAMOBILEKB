class UserModel {
  String uid;
  String username;
  String email;
  String? photoUrl;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.photoUrl,
  });
}
