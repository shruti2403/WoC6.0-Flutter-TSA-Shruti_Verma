import 'package:stock_market_trading_app/stocks/list.dart';

class FavoriteListModel
{
  static List<String> itemNames = [
    'AAPL',
    'GOOG',
    'general electronic',
    'GOOG',
    'GOOG',
    'GOOG',
    'GOOG',
    'GOOG',
    'GOOG',
    'GOOG',
  ];

  static List<String> itemSubtitle = [
    'Apple Inc',
    'Alphabet Inc',
    'GE',
    'Apple Inc',
    'Apple Inc',
    'Apple Inc',
    'Apple Inc',
    'Apple Inc',
    'Apple Inc',
    'Apple Inc',
  ];

  static List<double> itemprice = [
    150.25,
    150.25,
    150.25,
    150.25,
    105.25,
    150.25,
    150.25,
    150.25,
    150.25,
    150.25,

  ];

  Item getByID(int id) => Item(
    id,
    itemNames[id%itemNames.length],
    itemSubtitle[id%itemSubtitle.length],
    itemprice[id%itemprice.length],
  );

  Item getByPosition(int position){
    return getByID(position);
  }
}

class Item{
  final int id;
  final String name;
  final String subtitle;
  final double price;

  const Item(this.id,this.name,this.subtitle,this.price,);

  @override

  int get hashCode=> id;

  @override

  bool operator == (Object other) => other is Item && other.id == id;
}