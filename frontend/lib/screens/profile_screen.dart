import 'dart:html';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:image_picker/image_picker.dart';
import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  final fullnameController = new TextEditingController();
  final addressController = new TextEditingController();
  final dateController = new TextEditingController();
  final occupationController = new TextEditingController();

//String _initialValue = '';
  String dateChange = '';
  String dateValueChange = '';
  String saveDate = '';

  Future<void> getImage() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (image != null) {
      _image = File(image.readAsBytes(), image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text('Set Your Profile'),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color(0xff476cfb),
                  child: ClipOval(
                    child: new SizedBox(
                      width: 180.0,
                      height: 180.0,
                      child: (_image != null)
                          ? Image.file(
                              _image,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              "https://www.shutterstock.com/image-vector/user-icon-trendy-flat-style-isolated-1467725033?irclickid=3ikVrY1WpxyLUvFwUx0Mo3QEUkBym0RtP2ZaTc0&irgwc=1&utm_medium=Affiliate&utm_campaign=Icons8&utm_source=2052558&utm_term=&c3ch=Affiliate&c3nid=IR-2052558",
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.camera,
                    size: 30.0,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomInputBox(
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
          CustomInputBox(
            title: "Address",
            hint: "Address",
            isInvisible: false,
            icon: Icons.person,
            suffixIcon: null,
            controller: addressController,
          ),
          SizedBox(
            height: 20.0,
          ),
          DateTimePicker(
            type: DateTimePickerType.date,
            //dateMask: 'yyyy/MM/dd',
            controller: dateController,
            //initialValue: _initialValue,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(Icons.event),
            dateLabelText: 'Date',
            locale: Locale('pt', 'BR'),
            onChanged: (val) => setState(() => dateChange = val),
            validator: (val) {
              setState(() => dateValueChange = val ?? '');
              return null;
            },
            onSaved: (val) => setState(() => saveDate = val ?? ''),
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomInputBox(
            title: "Occupation",
            hint: "Occupation",
            isInvisible: false,
            icon: Icons.person,
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
              }),
        ]),
      ),
    );
  }
}
