import 'package:flutter/material.dart';
import '/Coin/coin.dart';
import '/Coin/coin_exchange.dart';
import '/statefullwidget/DropdownMenuWidget.dart';
import '/statefullwidget/TextFieldwidget.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class CryptoConvert extends StatefulWidget {
  const CryptoConvert({super.key});

  @override
  State<CryptoConvert> createState() => _CryptoConvertState();
}

class _CryptoConvertState extends State<CryptoConvert> {
  Coin? coin1 = coins['USD'];
  Coin? coin2 = coins['USD'];
  CoinExchange c_ex = CoinExchange(coins['USD']!, coins['USD']!, 1);
  TextEditingController controller = TextEditingController();

  void setAmount(double amount) {
    setState(() {
      c_ex = CoinExchange(coin1!, coin2!, amount);
    });
  }

  void updateSelectedCoin1(Coin coin) {
    setState(() {
      coin1 = coin;
    });
  }

  void updateSelectedCoin2(Coin coin) {
    setState(() {
      coin2 = coin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MytextWidget(
            text: "Crypto Convertor",
            google_font: GoogleFonts.AbrilFatface,
          ),
          centerTitle: true,
        ),
        body: Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Container(
              width: 300,
              height: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  MyDropdownMenu(
                    coin_map: coins,
                    width: 150,
                    updateSelectedCoin: updateSelectedCoin1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyDropdownMenu(
                    coin_map: coins,
                    width: 150,
                    updateSelectedCoin: updateSelectedCoin2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: controller,
                    keyboardtype: TextInputType.number,
                    hint: "Amount",
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        try {
                          setAmount(double.parse(controller.text));
                        } catch (e) {
                          print(e);
                        }
                      }, //Text("Convert ${coin1?.name} to ${coin2?.name}")
                      child: MytextWidget(
                        text:
                            "Convert ${coin1?.min_name} to ${coin2?.min_name}",
                        google_font: GoogleFonts.FiraSans,
                        size: 15,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  MytextWidget(
                    text: '${coin1.toString()}',
                    google_font: GoogleFonts.Lora,
                    size: 13,
                  ),
                  MytextWidget(
                    text: '${coin2.toString()}',
                    google_font: GoogleFonts.Lora,
                    size: 13,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MytextWidget(
                    text: c_ex.toString(),
                    google_font: GoogleFonts.Lora,
                    size: 18,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 227, 215, 215), // Background color
                borderRadius: BorderRadius.circular(13), // Rounded corners
                border: Border.all(
                    color: Colors.white, // Border color
                    width: 2 // Border width
                    ),
              ),
            ),
          ],
        ));
  }
}
