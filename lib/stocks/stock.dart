import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_market_trading_app/stocks/stockkss.dart';
import '../navbar.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        height: h,
        width: w,
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           colors: [
  //             Colors.yellow,
  //             Colors.yellow,
  //           ]
  //         ),
  //       ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             // Row(
  //             //   children: [
  //             //     Container(
  //             //       child: Text('Main'),
  //             //     )
  //             //   ],
  //             // ),
  //             Container(
  //               height: h*0.7,
  //               width: w,
  //               decoration: BoxDecoration(color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(50),
  //                 topRight: Radius.circular(50),
  //               )),
  //              
  //               child: Column(
  //                 children: [
  //                   SizedBox(height: h*0.03,),
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: w*0.08),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text('Stocks',
  //                       style: TextStyle(fontSize: 30),),
  //                       Icon(Icons.add)
  //                     ],
  //                   ),
  //   ),
  //   Expanded(child: ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (context,index)
  //   {
  //     return Text('data');
  //   },)
  //               )
  // ],
  //             ),
  //             )
  //           ],
  //         ),
        
        child: Padding(padding: const EdgeInsets.only(top: 7),
        child: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Search",
              prefix: Icon(Icons.search),
              fillColor: Colors.grey,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,style: BorderStyle.none
                ),
                borderRadius: BorderRadius.all(Radius.circular(16))
              )
            ),
          ),
        ),),
        // Stockkss(stocks: Stock.getAll()),
      ),
    );
  }
}
