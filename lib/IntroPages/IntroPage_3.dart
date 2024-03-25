// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AdditionalFiles/rounded_button.dart';
import '../HomePage.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 200,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/3.png'),
            ),
          ),
          const Spacer(),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Don't wait in line, ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: "Book an appointment",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFF50004),
                      fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          RoundedButton(
            height: 50,
            width: double.maxFinite,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
            color: Colors.red.shade400,
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
