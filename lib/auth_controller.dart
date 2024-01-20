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
    // Observe changes in authentication state
    _auth.authStateChanges().listen((User? newUser) {
      user(newUser);
      isLoggedIn(newUser != null);
      _initialScreen(newUser);
    });
  }

  void _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(email: user.email ?? ""));
    }
  }

  void register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _showSnackbar("Account creation failed", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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
