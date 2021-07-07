import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String? title;
  final VoidCallback? onTap;
  final Color? buttonColor, textColor;

  const CustomButton({
    Key? key, 
    this.title, 
    this.onTap, 
    this.buttonColor, 
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: buttonColor,
        ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

