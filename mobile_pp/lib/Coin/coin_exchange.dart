import 'package:mobile_pp/Coin/coin.dart';

class CoinExchange {
  final Coin coin1;
  final Coin coin2;
  final double amount;
  double exchange_coin = 0;
  CoinExchange(this.coin1, this.coin2, this.amount);

  void exchange() {
    double coin1Usd = coin1.rate_usd * amount;
    double coin2Usd = coin2.rate_usd;

    double fromCoin1ToCoin2 = coin1Usd / coin2Usd;
    exchange_coin = fromCoin1ToCoin2;
  }

  @override
  String toString() {
    exchange();
    return "$amount ${coin1.name} = \n${exchange_coin.toStringAsFixed(7)} ${coin2.name} ";
  }
}
