import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart' as salomon;
import 'package:simple_icons/simple_icons.dart';

import 'Admin/Admin.dart';
import 'User/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(
        3,
        20,
        40,
        40,
      ),
      bottomNavigationBar: salomon.SalomonBottomBar(
        backgroundColor: const Color.fromRGBO(
          6,
          74,
          130,
          130,
        ),
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          salomon.SalomonBottomBarItem(
            selectedColor: _currentIndex == 0 ? Colors.blue : Colors.black,
            icon: const Icon(Icons.face),
            title: const Text(''),
          ),
          salomon.SalomonBottomBarItem(
            selectedColor: _currentIndex == 1 ? Colors.blue : Colors.black,
            icon: const Icon(SimpleIcons.robotframework),
            title: const Text(''),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_currentIndex == 0)
              const User() // Show User page if _currentIndex is 0
            else if (_currentIndex == 1)
              const Admin() // Show Admin page if _currentIndex is 1
            else
              Container(), // Show an empty container if _currentIndex is neither 0 nor 1
          ],
        ),
      ),
    );
  }
}
