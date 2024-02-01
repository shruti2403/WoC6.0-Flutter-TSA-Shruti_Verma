import 'package:flutter/material.dart';
import 'package:stock_market_trading_app/stocks/list.dart';

class Stockkss extends StatelessWidget {
  final List<Stock> stocks;

  Stockkss({required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey);
      },
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${stock.symbol}",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // Combine all the content in the trailing property
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Existing trailing content
              Column(
                children: <Widget>[
                  Text(
                    "\$Rs${stock.price}",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: 75,
                    height: 15,
                    alignment: Alignment.center,
                    child: Text(
                      "+1.09%",
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              // Image at the end
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  "img/watchlist.png", // Add your image path here
                  width: 24, // Adjust the width as needed
                  height: 24, // Adjust the height as needed
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
