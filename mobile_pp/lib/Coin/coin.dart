import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Coin {
  int id;
  double rate_usd;
  String ticker;
  String abbreviation;

  Coin(
    this.id,
    this.rate_usd,
    this.ticker,
    this.abbreviation,
  );

  @override
  String toString() {
    return "1 $abbreviation = $rate_usd USD";
  }
}

List<Coin> coins = [];

void refreshcoins() async {
  try {
    final url = Uri.http('192.168.1.13', 'mobile_php/mobile_project/coin.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      coins.clear();
      final jsonresponse = convert.jsonDecode(response.body);

      for (var row in jsonresponse) {
        Coin coin = Coin(int.parse(row['id']), double.parse(row['rate_usd']),
            row['ticker'], row['abbreviation']);
        coins.add(coin);
      }
    } else {
      print("error ");
    }
  } catch (e) {
    print('Error $e');
  }
}
