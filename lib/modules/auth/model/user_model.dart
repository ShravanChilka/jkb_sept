import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  const UserModel({
    required this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.photoURL,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      userName: user.displayName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      userName: map['userName'] as String?,
      email: map['email'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      photoURL: map['photoURL'] as String?,
    );
  }

  final String id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? photoURL;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "photoURL": photoURL,
    };
  }
}
