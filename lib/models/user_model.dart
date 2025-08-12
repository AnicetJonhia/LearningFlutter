class UserModel {
  final String id;
  final String email;
  final String name;
  final bool isAdmin;
  final String? profileImage;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.isAdmin = false,
    this.profileImage,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      profileImage: map['profileImage'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'isAdmin': isAdmin,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}