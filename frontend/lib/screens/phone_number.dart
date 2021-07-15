import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/OPTScreen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Enter Your Phone Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "",
              hint: "Number",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomButton(
              title: "Continue",
              textColor: whiteColor,
              buttonColor: primaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhoneVerifyScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
