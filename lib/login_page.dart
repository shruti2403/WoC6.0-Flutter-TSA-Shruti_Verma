import 'package:stock_market_trading_app/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
                  height: h*0.3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "img/LoginPage.jpg"
                        ),
                        // fit: BoxFit.cover
                      )
                  )
              ),
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Login into your account",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 35,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1,1),
                                  color: Colors.grey.withOpacity(0.2)
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0

                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1,1),
                                  color: Colors.grey.withOpacity(0.2)
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0

                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0
                                  )
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(child: Container(),),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),

                    ],
                  )
              ),
              SizedBox(height: 50,),
              Container(
                width: w*0.5,
                height: h*0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                          "img/Signinbtn.jpg"
                      ),
                      // fit: BoxFit.cover
                    )
                ),
                child: Center(
                  child:
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                ),
              ),
              SizedBox(height: w*0.2,),
              RichText(text: TextSpan(
                  text: "Don\'t have an account?",
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
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
                    )
                  ]
              ))
            ]
        )
    );
  }
}
