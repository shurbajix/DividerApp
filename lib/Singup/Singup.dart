import 'package:derivtive/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
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
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
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
                    borderRadius: BorderRadius.circular(15),
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
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
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
                    borderRadius: BorderRadius.circular(15),
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
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 80.w,
              height: 5.h,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sing Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  thickness: 10,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Text(
                  'Sing Up with',
                  style: TextStyle(
                    color: Color.fromRGBO(24, 111, 208, 119),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 10,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff40A9FF),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: 5.w,
                      child: Image.asset(
                        'images/google.png',
                        fit: BoxFit.cover,
                        color: const Color.fromRGBO(9, 45, 81, 81),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff40A9FF),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: 8.w,
                      child: Image.asset(
                        'images/facebook.png',
                        fit: BoxFit.cover,
                        color: const Color.fromRGBO(9, 45, 81, 81),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            TextButton(
              onPressed: () {
                Get.to(const Login());
              },
              child: const Text(
                '''Already have an account!''',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
