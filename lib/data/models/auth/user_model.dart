import 'dart:convert';

import 'package:e_commerce_app/domain/entity/auth/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  User toEntity() {
    return User(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
      gender: gender,
    );
  }
}
