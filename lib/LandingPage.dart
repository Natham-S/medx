// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';
import 'package:medx/ID/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(
              16,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  32,
                ),
                topRight: Radius.circular(
                  32,
                ),
              ),
            ),
            width: double.maxFinite,
            child: Column(
              children: [
                const Text("MedX", style: HeadingTextStyle,),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: PageView(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Text(
                        "We save your data so that you don't face any allergies or miss your medications",
                        style: TaglinesTextStyle,
                      ),
                      Text(
                        "We use AI to predict status of your reports to save time of doctors",
                        style: TaglinesTextStyle,
                      ),
                      Text(
                        "Don't wait in line, Book an appointment",
                        style: TaglinesTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 32),
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 3,
                      dotColor: Colors.black26,
                      activeDotColor: accentColor,
                      radius: 8,
                    ),
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                  ),
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute<bool>(
                        fullscreenDialog: false,
                        builder: (BuildContext context) =>
                            const Login(),
                      ),
                    );
                    HapticFeedback.selectionClick();
                  },
                  height: 50,
                  width: double.maxFinite,
                  child: const Text(
                    "Get Started",
                    style: ButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
