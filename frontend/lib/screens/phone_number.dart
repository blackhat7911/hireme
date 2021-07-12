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
        title: Text('Phone Auth'),
        backgroundColor: primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Enter Your Phone Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),

            CustomInputBox(
              size: size,
              title: "",
              hint: "Number",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
            )
            // Container(
            //   margin: EdgeInsets.only(top: 40, right: 10, left: 10),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Phone Number',
            //       prefix: Padding(
            //         padding: EdgeInsets.all(4),
            //         child: Text('+977'),
            //       ),
            //     ),
            //     maxLength: 10,
            //     keyboardType: TextInputType.number,
            //     controller: _controller,
            //   ),
            // )
          ]),
          CustomButton(
            title: "Next",
            buttonColor: primaryColor,
            textColor: whiteColor,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneVerifyScreen()));
            },
          )
        ],
      ),
    );
  }
}
