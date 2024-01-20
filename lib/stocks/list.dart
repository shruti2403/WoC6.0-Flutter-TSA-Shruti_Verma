class Stock { // Use a more descriptive name (Stock)
  final String symbol;
  final String company;
  final double price;

  const Stock({
    required this.symbol,
    required this.company,
    required this.price,
  });

  static List<Stock> getAll() { // Use Stock as the return type
    return [
      // Add your stock data here, for example:
      Stock(symbol: 'AAPL', company: 'Apple Inc.', price: 150.25),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'general electronic', company: 'GE', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),
      Stock(symbol: 'GOOG', company: 'Alphabet Inc.', price: 2547.89),


    ];
  }
}
