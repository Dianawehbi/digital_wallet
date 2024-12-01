import 'package:flutter/material.dart';
import '/User/Amount.dart';
import '/statelesswidget/textwidget.dart';

class Userbalancecontainer extends StatelessWidget {
  final double width = 300;
  final double height = 70;
  final Color bordercolor;
  final double borderwidth;
  final Color color;
  final Amount amount;

  const Userbalancecontainer({
    super.key,
    required this.amount,
    this.bordercolor = Colors.white,
    this.color = const Color.fromARGB(255, 109, 114, 205),
    this.borderwidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(
                height: 6,
              ),
              MytextWidget(
                text: this.amount.coin.name,
                color: Colors.white,
                size: 18,
              ),
              MytextWidget(
                text: this.amount.coin.min_name,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          MytextWidget(
            text: "${this.amount.amount} \n${amount.coin.min_name}        ",
            color: Colors.white,
            size: 16,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: this.color, // Background color
        borderRadius: BorderRadius.circular(13), // Rounded corners
        border: Border.all(
            color: this.bordercolor, // Border color
            width: this.borderwidth // Border width
            ),
      ),
    );
  }
}
