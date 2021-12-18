import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/utils/flags.dart';

class DrawerSwitch extends StatefulWidget {
  DrawerSwitch(
      {Key? key,
      required this.lable,
      required this.value,
      required this.callback})
      : super(key: key);
  String lable;
  Function(bool change) callback;
  bool value;
  @override
  State<StatefulWidget> createState() => _DrawerSwitch();
}

class _DrawerSwitch extends State<DrawerSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.lable,
          style: const TextStyle(
            fontFamily: "capriola",
            fontSize: 16,
            color: Flags.descriptionLable,
          ),
        ),
        Switch(
          value: widget.value,
          onChanged: (val) => setState(() {
            widget.value = val;
            widget.callback(val);
          }),
        )
      ],
    );
  }
}
