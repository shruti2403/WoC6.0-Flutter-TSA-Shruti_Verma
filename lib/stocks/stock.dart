import 'package:flutter/material.dart';
import 'package:stock_market_trading_app/stocks/stockkss.dart';
import '../navbar.dart';
import 'list.dart';

class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks'),
      ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   "Stocks",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 10, right: 10), // Add padding
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stockkss(stocks: Stock.getAll()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
