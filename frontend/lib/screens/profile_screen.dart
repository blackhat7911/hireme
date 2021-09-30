import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/screens/worker%20screen/home_screen.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/constants/constants.dart';

class ProfileSetUpScreen extends StatefulWidget {
  final String username;
  const ProfileSetUpScreen({Key? key, required this.username})
      : super(key: key);

  @override
  _ProfileSetUpScreenState createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  File? _pickedImage;

  final _imagePicker = ImagePicker();
  final fullnameController = new TextEditingController();
  final addressController = new TextEditingController();
  final dateController = new TextEditingController();
  final phoneController = new TextEditingController();
  final occupationController = new TextEditingController();
  String dropdownValue = 'SEEKER';

  Future pickPhoto(ImageSource source) async {
    final _pickImage = await _imagePicker.pickImage(source: source);
    setState(() {
      _pickedImage = File(_pickImage!.path);
    });
  }

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
        centerTitle: true,
        title: Text(
          'Setup Your Profile',
          style: TextStyle(
            color: blackColor,
          ),
        ),
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
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return new Container(
                      height: 200,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Select One",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        pickPhoto(ImageSource.camera);
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                      ),
                                      iconSize: 50.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: size.width,
                                      alignment: Alignment.center,
                                      child: Text("Camera"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        pickPhoto(ImageSource.gallery);
                                      },
                                      icon: Icon(
                                        Icons.photo_album_outlined,
                                      ),
                                      iconSize: 50.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: size.width,
                                      alignment: Alignment.center,
                                      child: Text("Gallery"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: (_pickedImage == null)
                  ? CircleAvatar(
                      radius: 60,
                      backgroundColor: inputBoxColor,
                      child: _pickedImage == null
                          ? Icon(
                              Icons.person,
                              size: 60,
                              color: blackColor,
                            )
                          : Image.file(
                              File(_pickedImage!.path),
                              fit: BoxFit.contain,
                            ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundColor: inputBoxColor,
                      backgroundImage: FileImage(
                        File(_pickedImage!.path),
                      ),
                    ),
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
                      icon: Icons.calendar_today,
                      suffixIcon: null,
                      controller: dateController,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          maxTime: DateTime(2021, 7, 15),
                          minTime: DateTime(1970, 7, 15),
                          theme: DatePickerTheme(
                            backgroundColor: whiteColor,
                            itemStyle: TextStyle(
                              color: blackColor,
                              fontSize: 18.0,
                            ),
                          ),
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            setState(() {
                              dateController.text = date.toString();
                            });
                          },
                          currentTime: DateTime.now(),
                        );
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
              title: "Phone",
              hint: "Phone",
              isInvisible: false,
              icon: Icons.phone,
              suffixIcon: null,
              controller: phoneController,
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Type",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['SEEKER', 'WORKER']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              title: "Save and Continue",
              textColor: whiteColor,
              buttonColor: primaryColor,
              onTap: () {
                // loginUser(usernameController.text, passwordController.text);
                if (dropdownValue == 'SEEKER') {
                  Get.to(() => HomeScreen(
                        username: "",
                        imageUrl: ApiConstants.baseUrl +
                            '/' +
                            "static/avtar/IMG_20210824_130646_UusYJpL.jpg",
                        location: addressController.text,
                        phone: phoneController.text,
                      ));
                } else {
                  Get.to(() => WorkerHome(
                      imageUrl: ApiConstants.baseUrl +
                          '/' +
                          "static/avtar/IMG_20210824_130646_UusYJpL.jpg",
                      phone: phoneController.text,
                      location: addressController.text,
                      username: "username",
                      id: 1));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
