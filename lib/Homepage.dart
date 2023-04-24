import 'package:derivtive/Admin/Admin.dart';
import 'package:derivtive/User/User.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart' as salomon;
import 'package:simple_icons/simple_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> _pages = const <Widget>[
  User(),
  Admin(),
];
var _curretindex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 20, 40, 40),
      bottomNavigationBar: salomon.SalomonBottomBar(
          backgroundColor: const Color.fromRGBO(6, 74, 130, 130),
          currentIndex: _curretindex,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _curretindex = index;
            });
          },
          items: [
            salomon.SalomonBottomBarItem(
              selectedColor: _curretindex == 0 ? Colors.blue : Colors.black,
              icon: const Icon(
                Icons.face,
              ),
              title: const Text(
                '',
              ),
            ),
            salomon.SalomonBottomBarItem(
              selectedColor: _curretindex == 1 ? Colors.blue : Colors.black,
              icon: const Icon(
                SimpleIcons.robotframework,
              ),
              title: const Text(
                '',
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _pages.elementAt(_curretindex),
          ],
        ),
      ),
    );
  }
}
