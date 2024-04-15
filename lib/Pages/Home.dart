// ignore_for_file: file_names, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:ui';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/AdditionalFiles/TextForm.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';

import 'Ambulance.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double _borderRadius = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateBorderRadius);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateBorderRadius() {
    setState(() {
      double progress = (_scrollController.offset - 32) / (136 - 32);

      double easedProgress = Curves.easeInOut.transform(progress.clamp(0.0, 1));

      _borderRadius = lerpDouble(0.0, 32.0, easedProgress) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController SearchController = TextEditingController();
    CountDownController CountdownController = CountDownController();
    return Scaffold(
      // floatingActionButton: Container(
      //   height: 60,
      //   width: 160,
      //   decoration: const BoxDecoration(
      //     color: accentColor,
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(
      //         16,
      //       ),
      //     ),
      //   ),
      //   child: const Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Icon(
      //         Icons.add,
      //         color: Colors.white,
      //       ),
      //       Text(
      //         "Add Prescription",
      //         style: FormTextStyle2,
      //       )
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 50),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(_borderRadius),
                bottomLeft: Radius.circular(_borderRadius),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello',
                            style: FormTextStyle,
                          ),
                          TextSpan(
                            text: ',',
                            style: TextStyle(
                              fontSize: 20,
                              color: accentColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Hope you are doing well",
                      style: FormTextStyle,
                    ),
                    const Text(
                      "Mr. Agam",
                      style: SubHeadingTextStyle,
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 36, top: 0),
                  decoration: const BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        32,
                      ),
                      bottomRight: Radius.circular(
                        32,
                      ),
                    ),
                  ),
                  child: TextForm(
                    preIcon: const Icon(
                      Icons.search_sharp,
                      color: accentColor,
                    ),
                    hintText: "Search Symptom",
                    color: accentColor,
                    controller: SearchController,
                    icon: const Icon(
                      Icons.menu,
                      color: accentColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Symptoms ?",
                        style: AppbarTextStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                            color: accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12, right: 4),
                        width: 150,
                        decoration: const BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "High Fever",
                            style: ButtonTextStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Are you in Emergency ?",
                        style: AppbarTextStyle,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: double.maxFinite,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Column(
                                        children: [
                                          const Icon(
                                            Icons.emergency_outlined,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Agam, are you okay ?",
                                            style: SubHeadingTextStyle,
                                          ),
                                          const Text(
                                            "We are going to call ambulance in 10 seconds",
                                            style: TextFormTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          const Spacer(),
                                          CircularCountDownTimer(
                                            controller: CountdownController,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            textStyle: SubHeadingTextStyle,
                                            duration: 10,
                                            autoStart: true,
                                            isReverse: true,
                                            isReverseAnimation: true,
                                            fillColor: secondaryColor,
                                            ringColor: bgColor,
                                            strokeWidth: 10.0,
                                            strokeCap: StrokeCap.round,
                                            onComplete: () {
                                              Navigator.pop(context);
                                              Navigator.of(context, rootNavigator: true).push(
                                                CupertinoPageRoute<bool>(
                                                  fullscreenDialog: false,
                                                  builder: (BuildContext context) => const Ambulance(),
                                                ),
                                              );
                                              HapticFeedback.vibrate();
                                            },
                                          ),
                                          const Spacer(),
                                          RoundedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            width: double.maxFinite,
                                            height: 50,
                                            child: const Text(
                                              "Cancel ambulance",
                                              style: ButtonTextStyle,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.red.withOpacity(0.05),
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.red.withOpacity(0.075),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor:
                                        Colors.red.withOpacity(0.1),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.15),
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
                      ),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: 200,
                //   width: double.maxFinite,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     padding: EdgeInsets.zero,
                //     physics: const BouncingScrollPhysics(),
                //     itemCount: 4,
                //     itemBuilder: (context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           Navigator.of(context, rootNavigator: true).push(
                //             CupertinoPageRoute<bool>(
                //               fullscreenDialog: false,
                //               builder: (BuildContext context) =>
                //                   const BookAppointment(
                //                 doctor: 'Dr. Shrestha',
                //                 hospital: 'TIET, Patiala',
                //                 DocImage: "assets/doctor.png",
                //               ),
                //             ),
                //           );
                //           HapticFeedback.selectionClick();
                //         },
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Container(
                //               margin: const EdgeInsets.only(left: 12, right: 4),
                //               padding: const EdgeInsets.only(top: 16),
                //               width: 150,
                //               height: 150,
                //               decoration: const BoxDecoration(
                //                 color: bgColor,
                //                 borderRadius: BorderRadius.all(
                //                   Radius.circular(
                //                     16,
                //                   ),
                //                 ),
                //               ),
                //               child: const Image(
                //                 image: AssetImage("assets/doctor.png"),
                //                 fit: BoxFit.fitHeight,
                //               ),
                //             ),
                //             const Padding(
                //               padding:
                //                   EdgeInsets.only(left: 12, right: 4, top: 5),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     "Dr. Shrestha",
                //                     style: FormTextStyle,
                //                   ),
                //                   Text(
                //                     "TIET, Patiala",
                //                     style: SubFormTextStyle,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Your Medical History",
                    style: AppbarTextStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextFormTextStyle,
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
