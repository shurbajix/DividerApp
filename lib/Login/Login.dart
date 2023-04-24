import 'package:derivtive/Homepage.dart';
import 'package:derivtive/Singup/Singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Ok',
                              ),
                            ),
                          ],
                          title: const Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Color.fromRGBO(1, 98, 155, 155),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: SizedBox(
                            height: 30.h,
                            width: 20.w,
                            child: Column(
                              children: [
                                const Text(
                                  'Write Email Address',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  width: 70.w,
                                  height: 5.h,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Write Email to send Code',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                SizedBox(
                                  width: 50.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Rest',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Forget your password?'),
                  ),
                ],
              ),
            ),
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
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                    indent: 15,
                    endIndent: 15,
                  ),
                ),
                Text(
                  'Login with',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    indent: 15,
                    endIndent: 15,
                    thickness: 5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              height: 10.h,
            ),
            TextButton(
              onPressed: () {
                Get.to(const SingUp());
              },
              child: const Text(
                '''Dont't have an account?''',
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
