// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'AdditionalFiles/constants.dart';
import 'Pages/Appointments.dart';
import 'Pages/Home.dart';
import 'Pages/Support.dart';
import 'Pages/History.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Home(),
    const History(),
    const Appointments(),
    const Support(),
  ];

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),

        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              28,
            ),
            topRight: Radius.circular(
              28,
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: _onItemTap,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconSize: 28,
            selectedItemColor: accentColor,
            unselectedItemColor: Colors.black38,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.home),
                label: ('Home'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.paste),
                // ignore: deprecated_member_use
                label: ('History'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.access_time),
                // ignore: deprecated_member_use
                label: ('Appointment'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.chat),
                // ignore: deprecated_member_use
                label: ('Support'),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
