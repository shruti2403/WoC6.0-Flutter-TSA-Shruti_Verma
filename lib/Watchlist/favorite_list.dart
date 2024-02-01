import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_trading_app/Watchlist/watch_list.dart';
import 'package:stock_market_trading_app/Watchlist/watchlist_page_models.dart';
import 'package:http/http.dart' as http;

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Favorite', style: Theme.of(context).textTheme.headline1),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => Navigator.pushNamed(context, '/favoritepage'),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _MyListItem(index: index);
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
          (favotielist) => favotielist.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 60,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.name),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.subtitle, style: textTheme),
                  Text(
                    '\$${item.price}', // Assuming item.price is a num or double
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
          (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.deepOrange)
          : Icon(Icons.favorite_border),
      onPressed: () {
        var favoritepage = context.read<FavoritePageModel>();
        if (isInFavoritePage) {
          favoritepage.remove(item);
        } else {
          favoritepage.add(item);
        }
      },
    );
  }
}

//STOCKS