// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_market_trading_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_trading_app/welcome_page.dart';

import 'home.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override

  // void onReady()
  // {
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser) ;
  //   _user.bindStream(auth.userChanges());
  //   ever(_user, _initialScreen);
  // }
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
    });
  }

  _initialScreen(User? user)
  {
    if(user == null)
    {
      print("login page");
      Get.offAll(()=>LoginPage());
    }
    else
    {
      Get.offAll(()=>WelcomePage());
    }
  }

  void register(String email, password, name, number)async
  {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          )
      );

    }
  }
}