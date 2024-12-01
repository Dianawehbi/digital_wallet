import 'package:flutter/material.dart';
import '/User/user.dart';
import '/statefullwidget/TextFieldwidget.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';
import '/wallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  User user = users[1];

  bool check_user(String name, int phone_nb) {
    for (int i = 0; i < users.length; i++) {
      User u = users[i];
      if (u.name == name && u.phoneNb == phone_nb) {
        user = users[i];
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MytextWidget(
            text: "Welcome",
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
                  MytextWidget(
                    text: "Username:",
                    google_font: GoogleFonts.Lora,
                    size: 17,
                  ),
                  MyTextField(
                    controller: name_controller,
                    hint: "name",
                    width: 180,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MytextWidget(
                    text: "Phone Number:",
                    google_font: GoogleFonts.Lora,
                    size: 16,
                  ),
                  MyTextField(
                    controller: phone_controller,
                    hint: "number",
                    keyboardtype: TextInputType.number,
                    width: 180,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        try {
                          setState(() {
                            String name = name_controller.text;
                            int phone = int.parse(phone_controller.text);
                            if (check_user(name, phone)) {
                              user.totalbalance();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyWallet(),
                                  settings: RouteSettings(arguments: user)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Please Enter a valid name and phone number")));
                            }
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Icon(Icons.login))
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
