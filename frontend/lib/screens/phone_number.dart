// import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/state/mobile_verification_state.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final verificationId = "";
  bool showLoading = false;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _optController = TextEditingController();
  String initialCountry = 'NP';
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'NP');
  late var currentState = MobileVerificationState.FORM_STATE;

  getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'NP');

    setState(() {
      this._phoneNumber = number;
    });
    print(number);
    return number;
  }

  phoneNumberVerify() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }

  Future<void> signInWithPhoneNumber() async {
    await _auth.signInWithPhoneNumber(getPhoneNumber(_phoneController.text));
  }

  // send verification code firebase flutter
  Future<void> sendVerificationCode() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: getPhoneNumber(_phoneController.text),
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        if (verificationFailed.code == "invalid-phone-number") {
          print('Provided phone number is not valid');
        }
      },
      codeSent: (verificationId, resendingToken) async {
        print('verification code sent');
        setState(() {
          currentState = MobileVerificationState.OTP_STATE;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
        child: currentState == MobileVerificationState.FORM_STATE
            ? Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Enter Your Phone Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    initialValue: _phoneNumber,
                    textFieldController: _phoneController,
                    keyboardType: TextInputType.number,
                    inputBorder: OutlineInputBorder(),
                    isEnabled: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: "Continue",
                    textColor: whiteColor,
                    buttonColor: primaryColor,
                    onTap: () {
                      sendVerificationCode();
                      setState(() {
                        currentState = MobileVerificationState.OTP_STATE;
                      });
                    },
                  ),
                ],
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verify Your Code",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 32.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "We've sent 6-digit code to your phone. Please check and verify your phone here.",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: OTPTextField(
                          length: 6,
                          width: size.width,
                          fieldWidth: 50,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            _optController.text = pin;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        title: "Verify Code",
                        width: size.width,
                        buttonColor: primaryColor,
                        textColor: whiteColor,
                        onTap: () {
                          phoneNumberVerify();
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Didn't receive code? ",
                          style: TextStyle(color: blackColor),
                          children: [
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
