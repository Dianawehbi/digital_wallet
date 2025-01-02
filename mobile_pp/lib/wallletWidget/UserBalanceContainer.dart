import 'package:flutter/material.dart';
import 'package:mobile_pp/User/user.dart';
import '/User/Amount.dart';
import '/statelesswidget/textwidget.dart';

class MyListViewUserAmount extends StatelessWidget {
  // this widget is specified to make  loop for all user amount and display them
  const MyListViewUserAmount({
    super.key,
    required this.screensize,
    required this.user,
  });

  final double screensize;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: screensize * 0.85,
      child: ListView.builder(
          itemCount: user.amount_list.length,
          itemBuilder: (context, index) {
            return Userbalancecontainer(
              amount: user.amount_list[index],
              width: screensize * 0.85,
            );
          }),
    );
  }
}

// this widget display boxes, these boxes include the amount for each coin
class Userbalancecontainer extends StatelessWidget {
  final double width;
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
    this.width = 300,
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
                text: this.amount.coin.ticker,
                color: Colors.white,
                size: 18,
              ),
              MytextWidget(
                text: this.amount.coin.abbreviation,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          MytextWidget(
            text: "${this.amount.amount} \n${amount.coin.abbreviation}        ",
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
