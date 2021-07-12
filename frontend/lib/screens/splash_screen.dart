import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/phone_number.dart';
import 'package:frontend/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Text(
                "HireMe",
                style: TextStyle(color: primaryColor, fontSize: 32.0),
              ),
            ),
            Spacer(),
            Row(
              children: [
                CustomButton(
                  title: "Login",
                  width: size.width * 0.5,
                  buttonColor: primaryColor,
                  textColor: whiteColor,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                SizedBox(),
                CustomButton(
                  title: "Register",
                  width: size.width * 0.5,
                  buttonColor: inputBoxColor,
                  textColor: primaryColor,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
