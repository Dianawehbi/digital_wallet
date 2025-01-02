import 'package:flutter/material.dart';
import 'package:mobile_pp/Coin/coin.dart';
import 'package:mobile_pp/wallletWidget/UserBalanceContainer.dart';
import '/wallletWidget/Containerbutton.dart';
import '/User/user.dart';
import '/wallletWidget/UserInfoContainer.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    double screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  refreshcoins();
                });
              },
              icon: Icon(Icons.refresh))
        ],
        title: MytextWidget(
          text: "Wallet",
          google_font: GoogleFonts.AbrilFatface,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            MytextWidget(
              text: "Digital wallet",
              google_font: GoogleFonts.GrandHotel,
              size: 30,
            ),
            SizedBox(
              height: 10,
            ),
            UserContainer(
              height: 150,
              width: screensize * 0.85,
              user: user,
            ),
            SizedBox(
              height: 15,
            ),
            MyButtonContainer(
              user: user,
              width: screensize * 0.85,
            ),
            SizedBox(
              height: 10,
            ),
            MyListViewUserAmount(screensize: screensize, user: user),
          ],
        ),
      ),
    );
  }
}