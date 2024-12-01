import 'package:flutter/material.dart';
import '/User/user.dart';
import '/statelesswidget/Font/google_fonts.dart';
import '/statelesswidget/textwidget.dart';

class Receive extends StatefulWidget {
  final User user;
  const Receive({super.key, required this.user});

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MytextWidget(
          text: "Receive",
          google_font: GoogleFonts.AbrilFatface,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [MytextWidget(text: "  No receiving..")],
      ),
    );
  }
}
