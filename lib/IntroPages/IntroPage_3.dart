// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../AdditionalFiles/rounded_button.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
            child: Text(
              "CHOOSE A TRACK",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: RoundedButton(
              height: 200,
              width: double.maxFinite,
              onPressed: () {},
              color: const Color(0xFF6FB98F),
              child: const Text(
                'I WANT TO EARN',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            child: RoundedButton(
              height: 200,
              width: double.maxFinite,
              onPressed: () {},
              color: Colors.white.withOpacity(0.5),
              child: const Text(
                'I WANT TO EXPAND MY BUSINESS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
