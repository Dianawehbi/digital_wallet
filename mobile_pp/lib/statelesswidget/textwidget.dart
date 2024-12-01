import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MytextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontweigth;
  final String google_font;
  final FontStyle f_style;

  const MytextWidget({
    super.key,
    required this.text,
    this.size = 20,
    this.color = Colors.black,
    this.fontweigth = FontWeight.normal,
    this.google_font = 'Lato',
    this.f_style = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
          google_font,
        ).copyWith(
          fontSize: size,
          color: color,
          fontWeight: fontweigth,
          fontStyle: f_style,
        ));
  }
}
