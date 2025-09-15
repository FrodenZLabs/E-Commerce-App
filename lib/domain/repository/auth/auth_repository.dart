import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/data/models/auth/user_signin_model.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationModel user);
  Future<Either> signIn(UserSignInModel user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
