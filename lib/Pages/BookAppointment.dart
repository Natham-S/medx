// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/DraggableSheet.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';

class BookAppointment extends StatefulWidget {
  final String doctor;
  final String hospital;
  final DocImage;
  const BookAppointment(
      {super.key,
      required this.doctor,
      required this.hospital,
      required this.DocImage});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  var time;
  var date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (0.35),
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(widget.DocImage),
              ),
            ),
          ),
          DraggableSheet(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.doctor,
                      style: SubHeadingTextStyle,
                    ),
                    Text(
                      widget.hospital,
                      style: TextFormTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      style: AppbarTextStyle,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: TextFormTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Select Date",
                      style: AppbarTextStyle,
                    ),
                    SizedBox(
                      height: 100,
                      width: double.maxFinite,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: SizedBox(
                                height: 60,
                                child: Column(
                                  children: [
                                    Text("${today + index}"),
                                    (DateTime.now().weekday + index == 7)
                                        ? const Text("Sun")
                                        : Text(weekday[
                                    (DateTime.now().weekday + index)
                                        .toInt() %
                                        7]
                                        .toString()),
                                  ],
                                ),
                              ),
                              showCheckmark: false,
                              selectedColor: accentColor,
                              labelPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              backgroundColor: bgColor,
                              shadowColor: Colors.transparent,
                              selectedShadowColor: Colors.transparent,
                              labelStyle: (date == "${today + index}")
                                  ? AppbarTextStyle2
                                  : AppbarTextStyle,
                              selected:
                              (date == "${today + index}") ? true : false,
                              onSelected: (val) {
                                setState(() {
                                  date = "${today + index}";
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Select Time",
                      style: AppbarTextStyle,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text("${DateTime.now().hour + index}:00"),
                              showCheckmark: false,
                              labelPadding: const EdgeInsets.all(8),
                              selectedColor: accentColor,
                              backgroundColor: bgColor,
                              shadowColor: Colors.transparent,
                              selectedShadowColor: Colors.transparent,
                              labelStyle:
                              (time == "${DateTime.now().hour + index}:00")
                                  ? FormTextStyle2
                                  : FormTextStyle,
                              selected:
                              (time == "${DateTime.now().hour + index}:00")
                                  ? true
                                  : false,
                              onSelected: (val) {
                                setState(() {
                                  time = "${DateTime.now().hour + index}:00";
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      onPressed: () {},
                      height: 50,
                      width: double.maxFinite,
                      child: const Text(
                        "Book Appointment",
                        style: ButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              )
          ),
          // Expanded(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * (0.65),
          //     width: double.maxFinite,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(32),
          //         topRight: Radius.circular(32),
          //       ),
          //     ),
          //     child: ListView(
          //       padding: const EdgeInsets.all(16),
          //       scrollDirection: Axis.vertical,
          //       children: [
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           widget.doctor,
          //           style: SubHeadingTextStyle,
          //         ),
          //         Text(
          //           widget.hospital,
          //           style: TextFormTextStyle,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         const Divider(
          //           color: Colors.black38,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         const Text(
          //           "Description",
          //           style: AppbarTextStyle,
          //         ),
          //         const Text(
          //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          //           style: TextFormTextStyle,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         const Text(
          //           "Select Date",
          //           style: AppbarTextStyle,
          //         ),
          //         SizedBox(
          //           height: 100,
          //           width: double.maxFinite,
          //           child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             padding: EdgeInsets.zero,
          //             physics: const BouncingScrollPhysics(),
          //             itemCount: 5,
          //             itemBuilder: (context, index) {
          //               return Padding(
          //                 padding: const EdgeInsets.only(right: 8),
          //                 child: ChoiceChip(
          //                   label: SizedBox(
          //                     height: 60,
          //                     child: Column(
          //                       children: [
          //                         Text("${today + index}"),
          //                         (DateTime.now().weekday + index == 7)
          //                             ? const Text("Sun")
          //                             : Text(weekday[
          //                                     (DateTime.now().weekday + index)
          //                                             .toInt() %
          //                                         7]
          //                                 .toString()),
          //                       ],
          //                     ),
          //                   ),
          //                   showCheckmark: false,
          //                   selectedColor: accentColor,
          //                   labelPadding: const EdgeInsets.symmetric(
          //                       horizontal: 24, vertical: 8),
          //                   backgroundColor: bgColor,
          //                   shadowColor: Colors.transparent,
          //                   selectedShadowColor: Colors.transparent,
          //                   labelStyle: (date == "${today + index}")
          //                       ? AppbarTextStyle2
          //                       : AppbarTextStyle,
          //                   selected:
          //                       (date == "${today + index}") ? true : false,
          //                   onSelected: (val) {
          //                     setState(() {
          //                       date = "${today + index}";
          //                     });
          //                   },
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         const Text(
          //           "Select Time",
          //           style: AppbarTextStyle,
          //         ),
          //         SizedBox(
          //           height: 50,
          //           width: double.maxFinite,
          //           child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             padding: EdgeInsets.zero,
          //             physics: const BouncingScrollPhysics(),
          //             itemCount: 5,
          //             itemBuilder: (context, index) {
          //               return Padding(
          //                 padding: const EdgeInsets.only(right: 8),
          //                 child: ChoiceChip(
          //                   label: Text("${DateTime.now().hour + index}:00"),
          //                   showCheckmark: false,
          //                   labelPadding: const EdgeInsets.all(8),
          //                   selectedColor: accentColor,
          //                   backgroundColor: bgColor,
          //                   shadowColor: Colors.transparent,
          //                   selectedShadowColor: Colors.transparent,
          //                   labelStyle:
          //                       (time == "${DateTime.now().hour + index}:00")
          //                           ? FormTextStyle2
          //                           : FormTextStyle,
          //                   selected:
          //                       (time == "${DateTime.now().hour + index}:00")
          //                           ? true
          //                           : false,
          //                   onSelected: (val) {
          //                     setState(() {
          //                       time = "${DateTime.now().hour + index}:00";
          //                     });
          //                   },
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         RoundedButton(
          //           onPressed: () {},
          //           height: 50,
          //           width: double.maxFinite,
          //           child: const Text(
          //             "Book Appointment",
          //             style: ButtonTextStyle,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
