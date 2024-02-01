import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; // Added import for Firebase Core
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Id',
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;

                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: email, password: password);
                        print(userCredential);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('Weak Password');
                        } else if (e.code == 'email-already-in-use') {
                          print('Email is already in use');
                        } else if (e.code == 'invalid-email') {
                          print('Email is invalid');
                        }
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              );
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}











// TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    // TextEditingController numberController = TextEditingController();
    //
    //
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Column(
    //         children: <Widget>[
    //           Container(
    //             width: w,
    //             height: h*0.05,
    //             // decoration: const BoxDecoration(
    //             //     image: DecorationImage(
    //             //       image: AssetImage(
    //             //           "img/LoginPage.jpg"
    //             //       ),
    //             //       // fit: BoxFit.cover
    //             //     )
    //             // )
    //           ),
    //           SizedBox(height: 50,),
    //           Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     "Sign Up",
    //                     style: TextStyle(
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.bold
    //                     ),
    //                   ),
    //                   // Text(
    //                   //   "Login into your account",
    //                   //   style: TextStyle(
    //                   //       fontSize: 20,
    //                   //       color: Colors.grey
    //                   //   ),
    //                   // ),
    //                   // SizedBox(height: 35,),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(30),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               blurRadius: 10,
    //                               spreadRadius: 7,
    //                               offset: Offset(1,1),
    //                               color: Colors.grey.withOpacity(0.2)
    //                           )
    //                         ]
    //                     ),
    //                     child: TextField(
    //                       controller: emailController,
    //                       decoration: InputDecoration(
    //                           hintText: "Email Id",
    //                           prefixIcon: Icon(Icons.email,color:Colors.black ,),
    //                           focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //
    //                               )
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //                               )
    //                           )
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 10,),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(30),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               blurRadius: 10,
    //                               spreadRadius: 7,
    //                               offset: Offset(1,1),
    //                               color: Colors.grey.withOpacity(0.2)
    //                           )
    //                         ]
    //                     ),
    //                     child: TextField(
    //                       controller: passwordController,
    //                       obscureText: true,
    //                       decoration: InputDecoration(
    //                           hintText: "Password",
    //                           prefixIcon: Icon(Icons.password,color:Colors.black ,),
    //                           focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //
    //                               )
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //                               )
    //                           )
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 10,),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(30),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               blurRadius: 10,
    //                               spreadRadius: 7,
    //                               offset: Offset(1,1),
    //                               color: Colors.grey.withOpacity(0.2)
    //                           )
    //                         ]
    //                     ),
    //                     child: TextField(
    //                       controller: nameController,
    //                       decoration: InputDecoration(
    //                           hintText: "Name",
    //                           prefixIcon: Icon(Icons.face,color:Colors.black ,),
    //                           focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //
    //                               )
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //                               )
    //                           )
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 10,),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.white,
    //                         borderRadius: BorderRadius.circular(30),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               blurRadius: 10,
    //                               spreadRadius: 7,
    //                               offset: Offset(1,1),
    //                               color: Colors.grey.withOpacity(0.2)
    //                           )
    //                         ]
    //                     ),
    //                     child: TextField(
    //                       controller: numberController,
    //                       decoration: InputDecoration(
    //                           hintText: "Phone No.",
    //                           prefixIcon: Icon(Icons.phone,color:Colors.black ,),
    //                           focusedBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //
    //                               )
    //                           ),
    //                           enabledBorder: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(30),
    //                               borderSide: BorderSide(
    //                                   color: Colors.white,
    //                                   width: 1.0
    //                               )
    //                           )
    //                       ),
    //                     ),
    //                   ),
    //                   // Row(
    //                   //   children: [
    //                   //     Expanded(child: Container(),),
    //                   //     Text(
    //                   //       "Forgot Password?",
    //                   //       style: TextStyle(
    //                   //           fontSize: 20,
    //                   //           color: Colors.grey
    //                   //       ),
    //                   //     )
    //                   //   ],
    //                   // ),
    //
    //                 ],
    //               )
    //           ),
    //           SizedBox(height: 50,),
    //           GestureDetector(
    //             onTap: (){
    //               AuthController.instance.signUpwithEmailAndPassword(emailController.text.trim(), passwordController.text.trim() );
    //             },
    //             child: Container(
    //               width: w*0.5,
    //               height: h*0.08,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(30),
    //                   image: DecorationImage(
    //                     image: AssetImage(
    //                         "img/Signinbtn.jpg"
    //                     ),
    //                     // fit: BoxFit.cover
    //                   )
    //               ),
    //               child: Center(
    //                 child:
    //                 Text(
    //                   "Sign Up",
    //                   style: TextStyle(
    //                     fontSize: 30,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //
    //               ),
    //             ),
    //           ),
    //           SizedBox(height:10,),
    //           RichText(text: TextSpan(
    //               recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
    //               text: "Have an Account?",
    //               style:TextStyle(
    //                 fontSize: 20,
    //                 color: Colors.grey,
    //               )
    //           )),
    //           SizedBox(height: w*0.2,),
    //           // RichText(text: TextSpan(
    //           //     text: "Don\'t have an account?",
    //           //     style: TextStyle(
    //           //       color: Colors.grey,
    //           //       fontSize: 20,
    //           //     ),
    //           //     children: [
    //           //       TextSpan(
    //           //         text: " Create",
    //           //         style: TextStyle(
    //           //           color: Colors.black,
    //           //           fontSize: 20,
    //           //           fontWeight: FontWeight.bold,
    //           //         ),
    //           //       )
    //           //     ]
    //           // ))
    //         ]
    //     )
    // );

