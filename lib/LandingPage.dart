// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'IntroPages/IntroPage_1.dart';
import 'IntroPages/IntroPage_2.dart';
import 'IntroPages/IntroPage_3.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 32),
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  expansionFactor: 3,
                  dotColor: Colors.black26,
                  activeDotColor: Color(0xFFF50004),
                  radius: 8,
                ),
                controller: _controller,
                count: 3,
                axisDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
