import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Class/Class.dart';

class Manually extends StatefulWidget {
  const Manually({super.key});

  @override
  State<Manually> createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: SizedBox(
          width: 40.w,
          child: Image.asset(
            'images/DERIVATIVE.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(3, 20, 40, 40),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemExtent: 150,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 60,
                      right: 60,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff186FD0),
                      ),
                      onPressed: () {},
                      child: Text(
                        letters[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff021328),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
