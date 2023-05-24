import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class forget_password extends StatefulWidget {
  const forget_password({
    super.key,
  });

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _restPassword() async {
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    try {
      final user = await _auth.fetchSignInMethodsForEmail(email);
      if (user.isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('No Account found '),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'OK',
                    ),
                  ),
                ],
              );
            });
      } else {
        await _auth.sendPasswordResetEmail(email: email);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text(
                  'The information was send wait the answer',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'OK',
                    ),
                  ),
                ],
              );
            });
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Error please try again'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  backgroundColor: const Color.fromRGBO(3, 20, 40, 40),
                  shadowColor: Colors.transparent,
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
                      color: Colors.white,
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 70.w,
                          height: 5.h,
                          child: TextFormField(
                            controller: _usernameController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'username',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 70.w,
                          height: 5.h,
                          child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: ' Email Address',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
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
                            onPressed: _restPassword,
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
    );
  }
}
