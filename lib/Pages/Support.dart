// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../AdditionalFiles/constants.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Medical Support",
              style: SubHeadingTextStyle,
            ),
            Text(
              "(in collaboration with TICC)",
              style: AppbarTextStyle,
            ),
            Text(
              "College life is a time of change, growth, and transition. Attending college is an exciting and dynamic experience. It can also be a time of change as you grow and develop your identity. Attending college also presents its challenges. Students may have to deal with much stress due to numerous reasons, including moving away from home for the very first time, financial stress, academic stress, physical or mental illness (e.g., depression, anxiety), end of important relationships, illness, or death of a loved one. Sometimes, coping with one or more of these stresses can be overwhelming. Thapar Institute Counselling Cell, hereinafter referred to as TICC, has a duty to respect and support the rights, needs, and privacy of students experiencing mental health difficulties and provides a supportive environment that assists students with mental health difficulties to realize their full potential and to fully complete their course.",
              style: TextFormTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
