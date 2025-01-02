import '/Coin/coin.dart';
import '/User/Amount.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class User {
  int id;
  String name;
  int phoneNb;
  List amount_list = <Amount>[];
  double total_balance = 0;

  User(this.id, this.name, this.phoneNb, this.amount_list);

  void totalbalance() {
    total_balance = 0;
    for (int i = 0; i < amount_list.length; i++) {
      Amount aa = amount_list[i] as Amount;
      double total = aa.coin.rate_usd * aa.amount;
      total_balance += total;
    }
  }
}

List<User> users = [User(0, 'Default', 0, [])];

void refreshUser() async {
  try {
    final url =
        Uri.http('192.168.1.13', 'mobile_php/mobile_project/user_amount.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("User refresh");
      final jsonresponse = convert.jsonDecode(response.body);
      users.clear();
      int _user_id = 1;
      List<Amount> amounts = [];
      for (var row in jsonresponse) {
        int user_id = int.parse(row['user_id']);
        if (_user_id != user_id) {
          // new user
          _user_id = user_id;
          amounts.clear();
        } else {
          try {
            users.removeAt(int.parse(row['user_id']) - 1);
          } catch (e) {
            print('error : $e');
          }
        }
        Amount amount = Amount(
            coins[int.parse(row['coin_id']) - 1], double.parse(row['amount']));
        amounts.add(amount);
        User u = User(int.parse(row['user_id']), row['name'],
            int.parse(row['phone_number']), amounts);
        users.insert(int.parse(row['user_id']) - 1, u);
      }
    }
  } catch (e) {
    print(e);
  }
}
