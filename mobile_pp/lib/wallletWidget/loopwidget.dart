import 'package:flutter/material.dart';
import '/wallletWidget/UserBalanceContainer.dart';

class WidgetLoop extends StatefulWidget {
  final List amount_list;
  const WidgetLoop({super.key, required this.amount_list});

  Widget widgetmethos() {
    List<Widget> widgets = [];
    for (int i = 0; i < amount_list.length; i++) {
      widgets.add(Userbalancecontainer(amount: amount_list[i]));
    }
    return Column(children: widgets);
  }

  @override
  State<WidgetLoop> createState() => _WidgetLoopState();
}

class _WidgetLoopState extends State<WidgetLoop> {
  @override
  Widget build(BuildContext context) {
    return widget.widgetmethos();
  }
}
