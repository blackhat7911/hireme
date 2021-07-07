import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: (size.width)/2,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: primaryColor
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    width: (size.width)/2,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: primaryColor
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}