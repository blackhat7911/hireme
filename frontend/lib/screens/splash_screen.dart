import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/home_bloc/bloc/home_bloc.dart';
import 'package:frontend/bloc/login_bloc/login_bloc.dart';
import 'package:frontend/bloc/register_bloc/register_bloc_bloc.dart';
import 'package:frontend/screens/auth_screens/register_screen.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/screens/auth_screens/login_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
BlocProvider(create: (context) => RegisterBlocBloc()),
BlocProvider(create: (context) => HomeBloc()),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                            Get.to(
                                    () => LoginScreen());
                          },
                        ),
                        SizedBox(),
                        CustomButton(
                          title: "Register",
                          width: size.width * 0.5,
                          buttonColor: inputBoxColor,
                          textColor: primaryColor,
                          onTap: () {
                             Get.to(() => RegisterScreen());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
