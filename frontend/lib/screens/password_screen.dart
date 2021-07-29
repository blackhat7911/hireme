import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final password1Controller = new TextEditingController();
  final password2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: blackColor,
          onPressed: () {},
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Setup Password",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              title: "Password",
              hint: "Password",
              isInvisible: true,
              icon: Icons.lock,
              suffixIcon: Icons.visibility_off,
              controller: password1Controller,
              size: size,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              title: "Confirm Password",
              hint: "Confirm Password",
              isInvisible: true,
              icon: Icons.lock,
              suffixIcon: Icons.visibility_off,
              size: size,
              controller: password2Controller,
            ),
            SizedBox(height: 20.0),
            CustomButton(
                title: "Sign Up",
                textColor: whiteColor,
                buttonColor: primaryColor,
                onTap: () {},),
          ],
        ),
      ),
    );
  }
}
