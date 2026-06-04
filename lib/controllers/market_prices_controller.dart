import '../models/market_price_model.dart';

// fake daily rates shown on HOME screen

class MarketPriceNames {
  static const List<String> names = [
    'Gold 24K',
    'Gold 21K',
    'Gold 18K',
    'Silver 999',
    'Silver 925',
  ];
}

class MarketPriceValues {
  static const List<double> prices = [107.68, 94.22, 80.76, 1.05, 0.94];
}

class MarketPriceChanges {
  static const List<String> changes = ['+0.8%', '+0.6%', '+0.5%', '+1.2%', '-1.1%'];
}

class MarketPriceUpFlags {
  static const List<bool> flags = [true, true, true, true, false];
}

class MarketPricesController {
  List<MarketPriceModel> get prices {
    List<MarketPriceModel> list = [];
    for (int i = 0; i < MarketPriceNames.names.length; i++) {
      list.add(
        MarketPriceModel(
          name: MarketPriceNames.names[i],
          price: MarketPriceValues.prices[i],
          change: MarketPriceChanges.changes[i],
          isUp: MarketPriceUpFlags.flags[i],
        ),
      );
    }
    return list;
  }
}
