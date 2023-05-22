import 'package:derivtive/Login/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pallet Shuttle Bot',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
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
                height: 10.h,
              ),
              Text(
                '''Welcome,''',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Glad to see you!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              SizedBox(
                width: 70.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff40A9FF),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        Get.to(
                          const Login(),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: const Color.fromRGBO(3, 20, 40, 40),
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => ListView(
                            shrinkWrap: true,
                            children: [
                              AlertDialog(
                                actions: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'Ok',
                                      )),
                                ],
                                title: const Text('Copyright'),
                                content: const Text(
                                  '''
             Copyright (c) 2023 DERIVATIVE GROUP. All rights reserved.
                                      This mobile application and its contents are the intellectual property of DERIVATIVE GROUP and are protected by copyright laws. Unauthorized use, reproduction, or distribution of any part of this mobile application may result in severe civil and criminal penalties, and will be prosecuted to the fullest extent possible under the law.
                                      All trademarks, service marks, trade names, logos, and other designations used in this mobile application are the property of DERIVATIVE GROUP or their respective owners. You are not granted any right or license with respect to any of the aforesaid trademarks, service marks, trade names, logos, and other designations.
                                      This mobile application may contain links to other websites or resources. DERIVATIVE GROUP is not responsible for the availability of such external sites or resources, and does not endorse and is not responsible or liable for any content, advertising, products, or other materials on or available from such sites or resources.
                                      By using this mobile application, you agree to abide by all applicable laws and regulations, including without limitation, those related to copyright, trademark, patent, and intellectual property rights.
                                              If you have any questions or concerns about the copyright of this mobile application or any of its contents, please contact DERIVATIVE GROUP at info@derivativegroup.tech.                          
                                            ''',
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                    child: const Text(
                      'derivativegroup © All Rights Reserved',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
