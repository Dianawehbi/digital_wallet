import 'package:flutter/material.dart';
import '/wallletWidget/Containerbutton.dart';
import '/User/user.dart';
import '/wallletWidget/UserInfoContainer.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';
import '/wallletWidget/loopwidget.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
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
              user: user,
            ),
            SizedBox(
              height: 10,
            ),
            MyButtonContainer(
              user: user,
            ),
            SizedBox(
              height: 10,
            ),
            WidgetLoop(
              amount_list: user.amount_list,
            ),
          ],
        ),
      ),
    );
  }
}
