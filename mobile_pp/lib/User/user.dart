import '/Coin/coin.dart';
import '/User/Amount.dart';

class User {
  int id;
  String name;
  int phoneNb;
  int type; // 1: normal user   2: admin
  List amount_list = <Amount>[];
  double total_balance = 0;

  User(this.id, this.type, this.name, this.phoneNb, this.amount_list);

  void totalbalance() {
    total_balance = 0;
    for (int i = 0; i < amount_list.length; i++) {
      Amount aa = amount_list[i] as Amount;
      double total = aa.coin.rate_usd * aa.amount;
      total_balance += total;
    }
  }
}

List<User> users = [
  User(2, 1, "Rami", 710, [
    Amount(coins['USD'] as Coin, 2000),
    Amount(coins['Ethereum'] as Coin, 0.003),
    Amount(coins['Uniswap'] as Coin, 90)
  ]),
  User(1, 1, "Diana", 719, [
    Amount(coins['Bitcoin'] as Coin, 2.1),
    Amount(coins['USD'] as Coin, 1000),
  ]),
  User(3, 2, "admin", 123456, [
    Amount(coins['USD'] as Coin, 10000),
    Amount(coins['Uniswap'] as Coin, 1),
    Amount(coins['Bitcoin'] as Coin, 0.0001),
    Amount(coins['Ethereum'] as Coin, 1.11),
  ]),
];
