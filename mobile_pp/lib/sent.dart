import 'package:flutter/material.dart';
import '/Coin/coin.dart';
import '/User/Amount.dart';
import '/User/user.dart';
import '/statefullwidget/DropdownMenuWidget.dart';
import '/statefullwidget/TextFieldwidget.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class Sent extends StatefulWidget {
  final User user;

  const Sent({super.key, required this.user});

  @override
  State<Sent> createState() => _SentState();
}

class _SentState extends State<Sent> {
  TextEditingController controller_phone = TextEditingController();
  TextEditingController controller_amount = TextEditingController();

  Coin? coin = coins[0];

  void updateSelectedCoin(value) {
    setState(() {
      coin = value;
    });
  }

  bool checkphone_nb(int nb) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].phoneNb == nb) {
        return true;
      }
    }
    return false;
  }

  bool checkamount(double amount) {
    List user_amount_list = widget.user.amount_list;
    for (int i = 0; i < user_amount_list.length; i++) {
      Amount aa = user_amount_list[i] as Amount;
      if (aa.coin.ticker == coin?.ticker) {
        double available_amnount = aa.amount * 0.99;
        if (available_amnount >= amount) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double screensize = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: MytextWidget(
          text: "Sent",
          google_font: GoogleFonts.AbrilFatface,
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
            width: screensize * 0.05,
          ),
          Container(
            height: screenheight * 0.8,
            width: screensize * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                MytextWidget(
                  text: "${widget.user.name} sent to ...",
                  google_font: GoogleFonts.GrandHotel,
                  size: 24,
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                  controller: controller_phone,
                  hint: "Enter number...",
                  width: 170,
                  keyboardtype: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                MytextWidget(
                  text: "choose coin",
                  google_font: GoogleFonts.Lora,
                  size: 18,
                ),
                MyDropdownMenu(
                  updateSelectedCoin: updateSelectedCoin,
                  coins: coins,
                  width: 170,
                ),
                SizedBox(
                  height: 10,
                ),
                MytextWidget(
                  text: "choose amount",
                  google_font: GoogleFonts.Lora,
                  size: 18,
                ),
                MyTextField(
                  controller: controller_amount,
                  hint: "amount ...",
                  width: 170,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      try {
                        int phone_nb = int.parse(controller_phone.text);
                        double amount = double.parse(controller_amount.text);
                        if (checkamount(amount) && checkphone_nb(phone_nb)) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Done.")));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Failed")));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Icon(Icons.send)),
              ],
            ),
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 227, 215, 215), // Background color
              borderRadius: BorderRadius.circular(13), // Rounded corners
              border: Border.all(
                  color: Colors.white, // Border color
                  width: 2 // Border width
                  ),
            ),
          ),
          SizedBox(
            width: screensize * 0.05,
          ),
        ],
      ),
    );
  }
}
