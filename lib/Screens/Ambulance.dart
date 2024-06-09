// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/Utils/constants.dart';
import 'package:medx/Utils/rounded_button.dart';


class Ambulance extends StatelessWidget {
  const Ambulance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: RoundedButton(
          onPressed: () {
            Navigator.pop(context);
            HapticFeedback.selectionClick();
          },
          height: 50,
          width: double.maxFinite,
          child: const Text(
            "Okay",
            style: ButtonTextStyle,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.red.withOpacity(0.05),
                    child: CircleAvatar(
                      radius: 125,
                      backgroundColor: Colors.red.withOpacity(0.075),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.red.withOpacity(0.1),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.red.withOpacity(0.15),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/ambulance.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Ambulance is on its Way !",
              style: SubHeadingTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Agam, breathe slowly and deeply to lower your heart rate",
              style: TextFormTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
