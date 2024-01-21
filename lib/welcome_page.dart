import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_market_trading_app/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            // children: <Widget>[
            //   Container(
            //     width: w,
            //     height: h*0.05,
            //     // decoration: const BoxDecoration(
            //     //     image: DecorationImage(
            //     //       image: AssetImage(
            //     //           "img/LoginPage.jpg"
            //     //       ),
            //     //       // fit: BoxFit.cover
            //     //     )
            //     // )
            //   ),
            //   SizedBox(height: 50,),
            //   Text(
            //     email,
            //     style: TextStyle(
            //         fontSize: 40,
            //         fontWeight: FontWeight.bold
            //     ),
            //   ),
            //   SizedBox(height: 500,),
            //   GestureDetector(
            //     onTap: ()
            //     {
            //       AuthController.instance.logOut();
            //     },
            //     child: Container(
            //       width: w*0.5,
            //       height: h*0.08,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30),
            //           image: DecorationImage(
            //             image: AssetImage(
            //                 "img/Signinbtn.jpg"
            //             ),
            //             // fit: BoxFit.cover
            //           )
            //       ),
            //       child: Center(
            //         child:
            //         Text(
            //           "Sign Out",
            //           style: TextStyle(
            //             fontSize: 30,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white,
            //           ),
            //         ),
            //
            //       ),
            //     ),
            //   ),

            // ]
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  "My Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profileImage.webp'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                  child: Text(
                    email,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      title: Text("Portfolio"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.payment_outlined,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      title: Text("Wallet"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    // Divider(),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.loyalty,
                    //     size: 22,
                    //     color: Colors.greenAccent,
                    //   ),
                    //   title: Text("My Subscription"),
                    //   trailing: Icon(Icons.arrow_forward_ios),
                    // ),
                    // Divider(),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.group,
                    //     size: 22,
                    //     color: Colors.greenAccent,
                    //   ),
                    //   title: Text("Referrer Program"),
                    //   trailing: Icon(Icons.arrow_forward_ios),
                    // ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      title: Text("FAQs"),
                      trailing: Icon(Icons.question_mark),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.group,
                        size: 22,
                        color: Colors.greenAccent,
                      ),
                      title: Text("About us"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: ()
            //       {
            //         AuthController.instance.logOut();
            //       },
            //   child: Align(
            //     alignment: Alignment.topCenter,
            //     child: Padding(
            //       padding: EdgeInsets.all(15),
            //       child: ElevatedButton(
            //         style: ButtonStyle(
            //             backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.indigo.shade700)),
            //         onPressed: () {},
            //         child: Text(
            //                     "Sign Out",
            //                     style: TextStyle(
            //                       fontSize: 30,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //
            //       ),
            //     ),
            //   ),
            // )
            GestureDetector(
            onTap: ()
            {
            AuthController.instance.logOut();
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
            "Sign Out",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
            ),

            ),
            ),
            ),

    ],

        ),
    );
  }
}
