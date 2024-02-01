import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_trading_app/login_page.dart';
import 'package:stock_market_trading_app/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoggedIn = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? newUser) {
      print("Auth state changed: $newUser");
      user(newUser);
      isLoggedIn(newUser != null);
      _initialScreen(newUser);
    });
  }


  void _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.to(() => LoginView());
    } else {
      print("Welcome page");
      Get.to(() => WelcomePage(email: user.email ?? ""));
    }
  }


  Future<User?>signUpwithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential=  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      _showSnackbar("Account creation failed", e.toString());
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      _showSnackbar("Login failed", e.toString());
    }
  }

  void logOut() async {
    await _auth.signOut();
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(
      "About User",
      "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
