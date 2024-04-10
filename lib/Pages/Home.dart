// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/TextForm.dart';
import 'package:medx/AdditionalFiles/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController SearchController = TextEditingController();

    return Scaffold(
      // floatingActionButton: Container(
      //   height: 60,
      //   width: 200,
      //   decoration: const BoxDecoration(
      //     color: Color(0xFF4E54C8),
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
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 16,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 36, top: 60),
            decoration: const BoxDecoration(
              color: Color(0xFFE9E4F0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  32,
                ),
                bottomRight: Radius.circular(
                  32,
                ),
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
                              color: Color(0xFF4E54C8),
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
                  backgroundColor: Colors.blueGrey,
                  radius: 25,
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 36, top: 60),
            decoration: const BoxDecoration(
              color: Color(0xFFE9E4F0),
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
              preIcon: const Icon(Icons.search_sharp,
              color: Color(0xFF4E54C8),),
              hintText: "Search Symptom",
              color: const Color(0xFF4E54C8),
              controller: SearchController,
              icon: const Icon(Icons.menu,
                color: Color(0xFF4E54C8),),

            ),
          ),
        ],
      ),
    );
  }
}
