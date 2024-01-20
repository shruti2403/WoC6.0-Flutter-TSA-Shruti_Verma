import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_market_trading_app/stocks/list.dart';

class Stockkss extends StatelessWidget{
  final List<Stock>stocks;

  Stockkss({required this.stocks});

  @override
  Widget build(BuildContext context) {

   return ListView.separated(separatorBuilder: (context,index)
       {
         return Divider(color: Colors.grey,);
       },
     itemCount: stocks.length,
     itemBuilder: (context,index)
       {
         return Text("Stock",style: TextStyle(color: Colors.white));
       },
   );
  }

}