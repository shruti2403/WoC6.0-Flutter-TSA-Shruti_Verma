import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_trading_app/Watchlist/watchlist_page_models.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist',
        style: Theme.of(context).textTheme.headline1,),
      ),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8),
              child: _FavoritePageList(),
            ),),
          ],
        ),
      )
    );
  }
}

class _FavoritePageList extends StatelessWidget {
  const _FavoritePageList({super.key});

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context,index) => ListTile(
        // leading: Image.asset(favoritepage.items[index].image),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: ()
            {
              favoritepage.remove(favoritepage.items[index]);
            },
        ),

        title: Text(
          favoritepage.items[index].name,
          style: itemNameStyle,
        ),

        subtitle: Text(
          favoritepage.items[index].subtitle,
          style: TextStyle(fontSize: 16,color: Colors.grey),
        ),
      ),
    );
  }
}

