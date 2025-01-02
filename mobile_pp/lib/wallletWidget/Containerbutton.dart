import 'package:flutter/material.dart';
import '/User/user.dart';
import '/convert.dart';
import '/receive.dart';
import '/sent.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class MyButtonContainer extends StatefulWidget {
  final double width;
  final double height;
  final User user;
  const MyButtonContainer(
      {super.key, required this.user, this.width = 300, this.height = 80});

  @override
  State<MyButtonContainer> createState() => _MyButtonContainerState();
}

class _MyButtonContainerState extends State<MyButtonContainer> {
  void sent_button() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Sent(
              user: widget.user,
            )));
  }

  void receive_button() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Receive(
              user: widget.user,
            )));
  }

  void exchange_button() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CryptoConvert()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              MyButton_I_D(
                text: "sent",
                icon: Icon(Icons.send),
                buttonFun: sent_button,
              ),
              SizedBox(
                width: 20,
              ),
              MyButton_I_D(
                text: "receive",
                icon: Icon(Icons.get_app),
                buttonFun: receive_button,
              ),
              SizedBox(
                width: 20,
              ),
              MyButton_I_D(
                icon: Icon(Icons.currency_exchange),
                text: "convert",
                buttonFun: exchange_button,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: widget.height * 0.02,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 246, 251), // Background color
        borderRadius: BorderRadius.circular(13), // Rounded corners
        border: Border.all(
            color: Colors.white, // Border color
            width: 2 // Border width
            ),
      ),
    );
  }
}

class MyButton_I_D extends StatefulWidget {
  final String text;
  final Icon icon;
  final Function() buttonFun;
  const MyButton_I_D({
    super.key,
    required this.text,
    required this.icon,
    required this.buttonFun,
  });

  @override
  State<MyButton_I_D> createState() => _MyButton_I_DState();
}

class _MyButton_I_DState extends State<MyButton_I_D> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3,
        ),
        ElevatedButton(onPressed: () => widget.buttonFun(), child: widget.icon),
        SizedBox(
          height: 4,
        ),
        MytextWidget(
          text: widget.text,
          size: 16,
          google_font: GoogleFonts.Kalam,
        )
      ],
    );
  }
}
