import 'package:mobile_pp/Coin/coin.dart';

class Amount {
  Coin coin;
  double amount;
  Amount(this.coin, this.amount);

  @override
  String toString() {
    return "${coin.name} : $amount";
  }
}