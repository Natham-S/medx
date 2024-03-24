// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "FOR CONSUMERS",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/user.png'),
          ),
          const Spacer(),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "WATCH, EARN, GROW, GIFT",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xFF6FB98F),
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "ITS THAT SIMPLE",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF6FB98F),
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
