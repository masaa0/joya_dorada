import 'package:flutter/material.dart';

// calculator math - rates per gram for gold/silver purities

class GoldPurityLabels {
  static const List<String> labels = ['24K', '21K', '18K'];
}

class GoldPurityRates {
  static const List<double> rates = [107.68, 94.22, 80.76];
}

class SilverPurityLabels {
  static const List<String> labels = ['999 Fine', '925 Sterling'];
}

class SilverPurityRates {
  static const List<double> rates = [1.05, 0.94];
}

// used as a base class by CalculatorScreenState using standard inheritance
abstract class CalculatorController<T extends StatefulWidget> extends State<T> {
  List<String> get metals => const ['Gold', 'Silver'];

  double getRate(String metal, String purity) {
    if (metal == 'Gold') {
      final index = GoldPurityLabels.labels.indexOf(purity);
      if (index >= 0) return GoldPurityRates.rates[index];
    } else {
      final index = SilverPurityLabels.labels.indexOf(purity);
      if (index >= 0) return SilverPurityRates.rates[index];
    }
    return 0.0;
  }

  List<String> getPurities(String metal) {
    if (metal == 'Gold') return GoldPurityLabels.labels;
    return SilverPurityLabels.labels;
  }

  double calculateTotal(String metal, String purity, double grams) {
    return grams * getRate(metal, purity);
  }
}
