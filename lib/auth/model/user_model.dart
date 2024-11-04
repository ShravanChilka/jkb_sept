// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.createdAt,
  });

  final String name;
  final String email;
  final DateTime createdAt;

  @override
  String toString() =>
      'UserModel(name: $name, email: $email, createdAt: $createdAt)';
}
