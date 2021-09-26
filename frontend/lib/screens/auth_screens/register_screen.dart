import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/register_bloc/register_bloc_bloc.dart';
import 'package:frontend/data/repo/register_repo.dart';
import 'package:frontend/screens/profile_screen.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = new TextEditingController();
  final emailController = new TextEditingController();
  final password1Controller = new TextEditingController();
  final password2Controller = new TextEditingController();

  RegisterRepository _registerRepository = RegisterRepository();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterBlocBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: blackColor,
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: whiteColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register Here",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomInputBox(
                title: "Username",
                hint: "Username",
                isInvisible: false,
                icon: Icons.person,
                controller: usernameController,
                size: size,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomInputBox(
                title: "Email address",
                hint: "Email address",
                isInvisible: false,
                icon: Icons.mail,
                controller: emailController,
                size: size,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomInputBox(
                title: "Password",
                hint: "Password",
                isInvisible: true,
                icon: Icons.lock,
                controller: password1Controller,
                size: size,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomInputBox(
                title: "Confirm Password",
                hint: "Confirm Password",
                isInvisible: true,
                icon: Icons.lock,
                size: size,
                controller: password2Controller,
              ),
              SizedBox(height: 20.0),
              CustomButton(
                title: "Sign Up",
                textColor: whiteColor,
                buttonColor: primaryColor,
                onTap: () {
                  if (usernameController.text.isNotEmpty ||
                      emailController.text.isNotEmpty ||
                      password1Controller.text.isNotEmpty ||
                      password2Controller.text.isNotEmpty) {
                    if (password1Controller.text != password2Controller.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Password donot match"),
                        backgroundColor: Colors.grey,
                      ));
                    } else {
                      _registerRepository.userRegister(usernameController.text,
                          emailController.text, password1Controller.text);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Some error occured please try later"),
                      backgroundColor: Colors.grey,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
