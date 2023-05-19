import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/controllers/popup_controller.dart';
import 'package:comp491_mobile_frontend/services/firestore_util.dart';
import 'package:comp491_mobile_frontend/services/users_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Sign up with email and password
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      PopupController.showSnackbar("Register successful!");
      if (_auth.currentUser?.uid != null) {
        createUserDocumentIfNeeded(_auth.currentUser!.uid);
      }
      await Future.delayed(Duration(seconds: 2));
      Get.back();
      return userCredential;
    } catch (e) {
      // Handle signup errors
      print('Error signing up: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      PopupController.showSnackbar("Login successful!");
      if (_auth.currentUser?.uid != null) {
        createUserDocumentIfNeeded(_auth.currentUser!.uid);
      }

      await Future.delayed(Duration(seconds: 1));
      Get.toNamed(Routes.rootScreen);
      return userCredential;
    } catch (e) {
      // Handle signin errors
      if (e.toString() ==
          "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
        PopupController.showSnackbar("Login failed! Wrong id/password.");
      } else if (e.toString() ==
          "[firebase_auth/invalid-email] The email address is badly formatted.") {
        PopupController.showSnackbar("Login failed! Double check your email.");
      }
      print('Error signing in: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  void manageLogin(String email, String password) {
    Future<UserCredential?> cred = signIn(email, password);
  }

  void manageSignUp(String email, String password, String confirmPassword) {
    if (password == confirmPassword) {
      Future<UserCredential?> cred = signUp(email, password);
    } else {
      //show popup
    }
  }

  Future<void> createUserDocumentIfNeeded(String uid) async {
    var response = await FirestoreUtil.instance.getUsersResponseWithUid(0, uid);
    if (response.runtimeType == UsersResponse) {
    } else {
      FirestoreUtil.instance.createNewUserDocument();
    }
  }
}
