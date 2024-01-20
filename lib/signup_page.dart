// import 'package:first_project/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var numberController = TextEditingController();


    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Container(
                width: w,
                height: h*0.05,
                // decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(
                //           "img/LoginPage.jpg"
                //       ),
                //       // fit: BoxFit.cover
                //     )
                // )
              ),
              SizedBox(height: 50,),
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // Text(
                      //   "Login into your account",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.grey
                      //   ),
                      // ),
                      // SizedBox(height: 35,),
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
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "Email Id",
                              prefixIcon: Icon(Icons.email,color:Colors.black ,),
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password,color:Colors.black ,),
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
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: "Name",
                              prefixIcon: Icon(Icons.face,color:Colors.black ,),
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
                          controller: numberController,
                          decoration: InputDecoration(
                              hintText: "Phone No.",
                              prefixIcon: Icon(Icons.phone,color:Colors.black ,),
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
                      // Row(
                      //   children: [
                      //     Expanded(child: Container(),),
                      //     Text(
                      //       "Forgot Password?",
                      //       style: TextStyle(
                      //           fontSize: 20,
                      //           color: Colors.grey
                      //       ),
                      //     )
                      //   ],
                      // ),

                    ],
                  )
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  AuthController.instance.register(emailController.text.trim(), passwordController.text.trim() );
                },
                child: Container(
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
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(height:10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an Account?",
                  style:TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  )
              )),
              SizedBox(height: w*0.2,),
              // RichText(text: TextSpan(
              //     text: "Don\'t have an account?",
              //     style: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 20,
              //     ),
              //     children: [
              //       TextSpan(
              //         text: " Create",
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       )
              //     ]
              // ))
            ]
        )
    );
  }
}
