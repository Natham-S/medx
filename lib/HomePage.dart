// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'AdditionalFiles/constants.dart';
import 'Pages/Home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              32,
            ),
            topRight: Radius.circular(
              32,
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
            iconSize: 30,
            selectedItemColor: accentColor,
            unselectedItemColor: Colors.black38,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.home),
                // ignore: deprecated_member_use
                label: ('Home'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.file_copy_sharp),
                // ignore: deprecated_member_use
                label: ('Files'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.calendar_month_outlined),
                // ignore: deprecated_member_use
                label: ('Appointment'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.withOpacity(0),
                icon: const Icon(Icons.support_agent_outlined),
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
