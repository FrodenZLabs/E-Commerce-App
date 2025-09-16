import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/data/models/auth/user_signin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<Either> signUp(UserCreationModel user);
  Future<Either> signIn(UserSignInModel user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either> getAges() async {
    try {
      final returnedData = await FirebaseFirestore.instance
          .collection('Ages')
          .get();
      return Right(returnedData.docs);
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());

      return Right(userData);
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email is sent successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> signIn(UserSignInModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );

      return const Right('Sign in was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The password provided is too weak';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(UserCreationModel user) async {
    try {
      final returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'gender': user.gender,
            'age': user.age,
            'image': returnedData.user!.photoURL,
            'userId': returnedData.user!.uid,
          });
      return const Right('Sign up was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }

      return Left(message);
    }
  }
}
