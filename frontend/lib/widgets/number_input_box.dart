import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class NumberInputBox extends StatelessWidget {
  const NumberInputBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: inputBoxColor,
      ),
      child: TextFormField(
        maxLength: 1,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: InputBorder.none, counterText: ""),
      ),
    );
  }
}