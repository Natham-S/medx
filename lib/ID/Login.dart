// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/HomePage.dart';
import 'package:medx/ID/CreateAccount.dart';

import '../AdditionalFiles/TextForm.dart';
import '../AdditionalFiles/constants.dart';
import '../AdditionalFiles/rounded_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController RollnumberController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "MedX",
                style: HeadingTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome",
                style: SubHeadingTextStyle,
              ),
              const Text(
                "Please fill the details to create an account",
                style: FormTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                hintText: "Enter Roll number",
                color: Colors.black38,
                controller: RollnumberController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                hintText: "Create Password",
                color: Colors.black38,
                controller: PasswordController,
                icon: GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                  child: Icon(
                    (passwordVisibility) ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: Colors.black38,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: accentColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) =>
                      const HomePage(),
                    ),
                  );
                  HapticFeedback.selectionClick();
                },
                height: 50,
                width: double.maxFinite,
                child: const Text(
                  "Log In",
                  style: ButtonTextStyle,
                ),
              ),
              const Spacer(),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushReplacement(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: false,
                            builder: (BuildContext context) =>
                                const CreateAccount(),
                          ),
                        );
                        HapticFeedback.selectionClick();
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
