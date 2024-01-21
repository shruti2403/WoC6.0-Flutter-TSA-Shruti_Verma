import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_trading_app/signup_page.dart';
import 'package:stock_market_trading_app/auth_controller.dart';
import 'package:stock_market_trading_app/welcome_page.dart'; // Import your AuthController

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: w,
            height: h * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/LoginPage.jpg"),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Login into your account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 35),
                _buildTextField("Username"),
                SizedBox(height: 10),
                _buildTextField("Password", isPassword: true),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          _buildSignInButton(w, h),
          SizedBox(height: w * 0.2),
          _buildCreateAccountLink(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSignInButton(double w, double h) {
    return GestureDetector(
      onTap: () {
        // Add your login logic here
        AuthController.instance.signInWithEmailAndPassword("username", "password").then((user) {
          if (user != null) {
            // Login successful, navigate to WelcomePage
            Get.off(() => WelcomePage(email: "example@example.com")); // Replace with the actual email
          } else {
            // Handle login failure, show an error message if necessary
            print("Login failed");
          }
        });
      },
      child: Container(
        width: w * 0.5,
        height: h * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage("img/Signinbtn.jpg"),
          ),
        ),
        child: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountLink() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: " Create",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.to(() => SignUpPage()),
          ),
        ],
      ),
    );
  }
}
