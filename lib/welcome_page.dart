import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              Text(
                "Shruti Verma",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 500,),
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
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                ),
              ),

            ]
        )
    );
  }
}
