import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class CustomInputBox extends StatelessWidget {

  final String? title, hint;
  final IconData? icon, suffixIcon;
  final bool? isInvisible;
  final TextEditingController? controller;

  const CustomInputBox({
    Key? key, 
    this.title, 
    this.hint, 
    this.icon, 
    this.suffixIcon, 
    this.isInvisible, 
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 18.0
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 3.0
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: inputBoxColor,
            ),
            child: TextFormField(
              controller: controller,
              obscureText: isInvisible!,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                suffixIcon: Icon(suffixIcon),
                hintText: hint!,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
