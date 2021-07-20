// import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/state/mobile_verification_state.dart';
import 'package:frontend/widgets/custom_button.dart';
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
  String initialCountry = 'NPL';
  // PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'NPL');
  late var currentState = MobileVerificationState.FORM_STATE;

  // getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number =
  //       await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'NPL');

  //   setState(() {
  //     this._phoneNumber = number;
  //   });
  //   print(number);
  //   return number;
  // }

  Future<void> signInWithPhoneNumber(
      PhoneAuthCredential _authCredintail) async {
    setState(() {
      showLoading = true;
    });
    try {
      final _phoneCredintail =
          await _auth.signInWithCredential(_authCredintail);
      setState(() {
        showLoading = false;
      });
      if (_phoneCredintail.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileSetUpScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  // send verification code firebase flutter
  Future<void> sendVerificationCode() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: await (_phoneController.text),
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, resendingToken) async {
        print('verification code sent');
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
                  // CountryCodePicker(
                  //   initialSelection: 'NP',
                  //   favorite: ['+977', 'NP'],
                  //   showCountryOnly: false,
                  //   showOnlyCountryWhenClosed: false,
                  //   alignLeft: true,
                  //   onChanged: (CountryCode code) {
                  //     print('object ${code}');
                  //   },
                  //   flagDecoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(7),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: "Continue",
                    textColor: whiteColor,
                    buttonColor: primaryColor,
                    onTap: () {
                      // sendVerificationCode();
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
                        "Verify Your Email",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 32.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "We've sent 5-digit code to your email. Please check and verify your email here.",
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
                          length: 5,
                          width: size.width,
                          fieldWidth: 60,
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
                        onTap: () async {
                          PhoneAuthCredential _authCredintial =
                              await PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: _optController.text,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSetUpScreen()));
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
