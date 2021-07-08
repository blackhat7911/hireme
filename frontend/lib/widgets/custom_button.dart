import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? buttonColor, textColor;
  final double? width;
  const CustomButton({
    Key? key, 
    this.title, 
    this.onTap, 
    this.buttonColor, 
    this.textColor, 
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0
        ),
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