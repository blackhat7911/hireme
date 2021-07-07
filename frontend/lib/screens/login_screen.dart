import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/splash_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  loginUser(String username, String password) async {
    Map jsonResponse;
    var url = Uri.parse("http://192.168.3.4:8000/api-token-auth/");
    var response = await http.post(url,
      body: {
        "username": username,
        "password": password
      }
    );
    
    if(response.statusCode == 200){
      jsonResponse = json.decode(response.body);
      Navigator.of(this.context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
    }
    else{
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: blackColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));
          },
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
              textColor: whiteColor,
              buttonColor: primaryColor,
              onTap: (){
                  loginUser(usernameController.text, passwordController.text);
              }
            ),
          ],
        ),
      ),
    );
  }
}