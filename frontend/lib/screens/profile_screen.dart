import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
// import 'package:image_picker/image_picker.dart';
import '../constants.dart';

class ProfileSetUpScreen extends StatefulWidget {
  const ProfileSetUpScreen({Key? key}) : super(key: key);

  @override
  _ProfileSetUpScreenState createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  // File? _image;

  final fullnameController = new TextEditingController();
  final addressController = new TextEditingController();
  final dateController = new TextEditingController();
  final occupationController = new TextEditingController();

//String _initialValue = '';
  String dateChange = '';
  String dateValueChange = '';
  String saveDate = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: blackColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text('Setup Your Profile'),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xff476cfb),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Fullname",
              hint: "Fullname",
              isInvisible: false,
              icon: Icons.person,
              suffixIcon: null,
              controller: fullnameController,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomInputBox(
                      size: size,
                      title: "Date Of Birth",
                      hint: "Date Of Birth",
                      isInvisible: false,
                      icon: Icons.person,
                      suffixIcon: null,
                      controller: addressController,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        // DatePicker.showDatePicker(
                        //   context,
                        //   showTitleActions: true,
                        //   maxTime: DateTime(2021, 7, 15),
                        //   minTime: DateTime(1970, 7, 15),
                        // );
                      },
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Address",
              hint: "Address",
              isInvisible: false,
              icon: Icons.location_on,
              suffixIcon: null,
              controller: addressController,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomInputBox(
              size: size,
              title: "Occupation",
              hint: "Occupation",
              isInvisible: false,
              icon: Icons.work,
              suffixIcon: null,
              controller: occupationController,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              title: "Save and Continue",
              textColor: whiteColor,
              buttonColor: primaryColor,
              onTap: () {
                // loginUser(usernameController.text, passwordController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
