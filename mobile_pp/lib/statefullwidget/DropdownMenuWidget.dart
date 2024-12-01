import 'package:flutter/material.dart';
import 'package:mobile_pp/Coin/coin.dart';

class MyDropdownMenu extends StatefulWidget {
  final double width;
  final Map coin_map;
  final Function(Coin) updateSelectedCoin;
  const MyDropdownMenu({
    super.key,
    this.width = 300,
    required this.updateSelectedCoin,
    required this.coin_map,
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
      dropdownMenuEntries: widget.coin_map.entries
          .map((e) => DropdownMenuEntry(value: e.value, label: e.key))
          .toList(),
      initialSelection: widget.coin_map['USD'],
      onSelected: (value) {
        widget.updateSelectedCoin(value);
      },
    );
  }
}
