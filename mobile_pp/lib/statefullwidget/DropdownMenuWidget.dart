import 'package:flutter/material.dart';
import 'package:mobile_pp/Coin/coin.dart';

class MyDropdownMenu extends StatefulWidget {
  final double width;
  final List coins;
  final Function(Coin) updateSelectedCoin;
  const MyDropdownMenu({
    super.key,
    this.width = 300,
    required this.updateSelectedCoin,
    required this.coins,
  });

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: widget.width,
      // dropdownMenuEntries : should be list of drop down entries
      dropdownMenuEntries: widget.coins
          .map((e) => DropdownMenuEntry(value: e, label: e.ticker))
          .toList(),
      initialSelection: widget.coins[0],
      onSelected: (value) {
        widget.updateSelectedCoin(value);
      },
    );
  }
}
