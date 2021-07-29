import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/widgets/custom_button.dart';


class SelectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: blackColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Please Select who you are.",
                style: TextStyle(color: blackColor),
              ),
            ),
            CustomButton(
              title: "I'm Seeker",
              buttonColor: primaryColor,
              textColor: whiteColor,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButton(
              title: "I'm Worker",
              buttonColor: inputBoxColor,
              textColor: blackColor,
              onTap: () {
                
              },
            )
          ]
        )
      )
    );
  }
}
