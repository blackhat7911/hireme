import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/phone_number.dart';
import 'package:frontend/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasConnection = true;
  Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;

  Stream<int> hasInternet() async* {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      await Future<void>.delayed(Duration(seconds: 1));
      yield 1;
    }
  }

  Future<void> hasInternetConnection() async {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.wifi ||
        connection == ConnectivityResult.mobile) {
      setState(() {
        hasConnection = true;
      });
    } else {
      setState(() {
        hasConnection = false;
      });
    }
  }

  Future<void> stillHasInternetConnection(
      ConnectivityResult _connResult) async {
    switch (_connResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() {
          hasConnection = true;
        });
        break;
      case ConnectivityResult.none:
        setState(() {
          hasConnection = false;
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    hasInternet();
    // hasInternetConnection();
    // _subscription =
    //     _connectivity.onConnectivityChanged.listen(stillHasInternetConnection);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<int>(
        stream: hasInternet(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print('nO Connection');
          }
          print('has connection');
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      "HireMe",
                      style: TextStyle(color: primaryColor, fontSize: 32.0),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButton(
                        title: "Login",
                        width: size.width * 0.5,
                        buttonColor: primaryColor,
                        textColor: whiteColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                      SizedBox(),
                      CustomButton(
                        title: "Register",
                        width: size.width * 0.5,
                        buttonColor: inputBoxColor,
                        textColor: primaryColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
