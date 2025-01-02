import 'package:flutter/material.dart';
import '/User/user.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class UserContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color bordercolor;
  final double borderwidth;
  final Color color;
  final User user;

  const UserContainer({
    super.key,
    required this.user,
    this.width = 300,
    this.height = 200,
    this.bordercolor = Colors.white,
    this.color = const Color.fromARGB(255, 227, 215, 215),
    this.borderwidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: this.width * 0.02,
        ),
        Column(
          children: [
            MytextWidget(
              text: "\n  User Info :",
              google_font: GoogleFonts.Kalam,
              size: 18,
            ),
            MytextWidget(
              text: "   ${user.name} \n   ${user.phoneNb}",
              google_font: GoogleFonts.Lora,
              size: 20,
            )
          ],
        ),
        SizedBox(
          width: this.width * 0.02,
        ),
        Column(
          children: [
            MytextWidget(
              text: "\nTotal Balance:  ",
              google_font: GoogleFonts.Lora,
              size: 18,
            ),
            MytextWidget(
              text: "  ${user.total_balance.toStringAsFixed(2)}\$       ",
              google_font: GoogleFonts.Lora,
              size: 20,
            )
          ],
        ),
        SizedBox(
          width: this.width * 0.02,
        ),
      ]),
      decoration: BoxDecoration(
        color: this.color, // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(
            color: this.bordercolor, // Border color
            width: this.borderwidth // Border width
            ),
      ),
    );
  }
}
