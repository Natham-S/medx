// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/AdditionalFiles/TextForm.dart';

import '../AdditionalFiles/constants.dart';
import 'Login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController RollnumberController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
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
                controller: RollnumberController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                hintText: "Enter Email ID",
                controller: EmailController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextForm(
                hintText: "Create Password",
                controller: PasswordController,
              ),
              const Spacer(),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Having an Account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pushReplacement(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: false,
                            builder: (BuildContext context) =>
                            const Login(),
                          ),
                        );
                        HapticFeedback.selectionClick();
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF4E54C8),
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
