import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: blackColor,
          onPressed: (){},
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login Here",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            ),
            SizedBox(height: 20.0,),
            CustomInputBox(
              title: "Username",
              hint: "Username",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
              controller: usernameController,
            ),
            SizedBox(height: 20.0,),
            CustomInputBox(
              title: "Password",
              hint: "Password",
              isInvisible: true,
              icon: Icons.lock,
              suffixIcon: Icons.visibility_off,
              controller: passwordController,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              title: "Sign In",
              onTap: (){
                if (usernameController.text.length == 0 || passwordController.text.length==0){
                  print('Entry fields cannot be empty');
                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}