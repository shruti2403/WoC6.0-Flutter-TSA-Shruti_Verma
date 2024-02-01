import 'package:flutter/cupertino.dart';
import 'package:stock_market_trading_app/Watchlist/watch_list.dart';

class FavoritePageModel extends ChangeNotifier{
  late FavoriteListModel _favoritelist;

  final List <int> _itemIds = [];

  FavoriteListModel get favoritelist => _favoritelist;

  set favoritelist(FavoriteListModel newList)
  {
    _favoritelist = newList;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _favoritelist.getByID(id)).toList();

  void add(Item item)
  {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item)
  {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}