import 'package:derivtive/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Forget_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 20, 40, 40),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.w,
                  child: Image.asset(
                    'images/DERIVATIVE.png',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 80.w,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 80.w,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ),
            const forget_password(),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 80.w,
              height: 5.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff40A9FF),
                ),
                onPressed: () {
                  Get.to(
                    const HomePage(),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
