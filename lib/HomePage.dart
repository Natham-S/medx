// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'AdditionalFiles/rounded_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Add Prescription",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Hi Agam",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFF50004),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              height: 100,
              width: double.maxFinite,
              onPressed: () {
                // Navigator.of(context, rootNavigator: true).push(
                //   CupertinoPageRoute<bool>(
                //     fullscreenDialog: false,
                //     builder: (BuildContext context) => const HomePage(),
                //   ),
                // );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book an appointment',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Q+',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: const Center(
                child: Text("AI HISTORY (MEDICAL PROFILE)"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16,
                            ),
                          ),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Center(
                          child: Text(
                            "Eat more fish, including a portion of oily fish",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedButton(
              onPressed: () {},
              height: 100,
              width: double.maxFinite,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    child: Image(
                      image: NetworkImage(
                        "https://5.imimg.com/data5/SELLER/Default/2022/4/JB/EL/NQ/23010464/natural-neem-leaves.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      "Drinking neem juice can help reorganize and reboot one’s digestive process.",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
