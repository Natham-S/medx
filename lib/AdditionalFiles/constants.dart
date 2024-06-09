// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names

import 'package:flutter/material.dart';

final today = DateTime.now().day;
final weekday = {
  1: "Mon",
  2: "Tues",
  3: "Wed",
  4: "Thurs",
  5: "Fri",
  6: "Sat",
  7: "Sun",
};

const Color accentColor = Color(0xFF337D73);
const Color bgColor = Color(0xFFEDFBF1);
const Color secondaryColor = Color(0xFFA497FF);

const HeadingTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  color: accentColor,
);

const TextButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: accentColor,
);

const SubHeadingTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const SubHeadingTextStyle2 = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);


const FormTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const FormTextStyle2 = TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const SubFormTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.black38,
  fontWeight: FontWeight.w500,
);

const SubFormTextStyle2 = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const TextFormTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Colors.black87,
);

const AppbarTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const AppbarTextStyle2 = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const ButtonTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

const TaglinesTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black38,
  fontWeight: FontWeight.w600,
);