import 'package:flutter/material.dart';
import 'package:frontend/data/repo/login_repo.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isChecked = false;

  LoginRepository loginRepository = LoginRepository();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: blackColor,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Here",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Username",
              hint: "Username",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
              controller: usernameController,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Password",
              hint: "Password",
              isInvisible: isChecked == false ? true : false,
              icon: Icons.lock,
              suffixIcon:
                  isChecked == false ? Icons.visibility_off : Icons.visibility,
              controller: passwordController,
              error: "",
            ),
            SizedBox(height: 20.0),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: primaryColor,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Show Password")
                ],
              ),
            ),
            SizedBox(height: 20.0),
            CustomButton(
              title: "Signin",
              textColor: whiteColor,
              buttonColor: primaryColor,
              onTap: () {
                if (usernameController.text.isNotEmpty ||
                    passwordController.text.isNotEmpty) {
                  loginRepository.userLogin(
                      usernameController.text, passwordController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter a username and password"),
                    backgroundColor: Colors.grey,
                  ));
                }
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "Forgot Password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
