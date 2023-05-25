import 'package:derivtive/Showlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Admin extends StatefulWidget {
  const Admin({
    super.key,
  });

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff031428),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 40.w,
                child: Expanded(
                  child: Image.asset(
                    'images/DERIVATIVE.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 90,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAllNamed('/');
                      },
                      icon: Image.asset(
                        'images/power-off.png',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'User Generator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 70.w,
            child: Form(
              //key: _formKey,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                //controller: _usernameController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  hintText: 'User Generator',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
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
            child: Form(
              //key: _formKey,
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                //controller: _passwordController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  hintText: 'Create Password',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
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
            child: Form(
              //key: _formKey,
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                //controller: _confirmPasswordController,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff40A9FF),
                  ),
                  onPressed: () {}, //_createUserGenerator,
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Color(0xff021328),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'BOT Generator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 70.w,
            child: TextFormField(
              //controller: _ipController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'IP Address',
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
            width: 70.w,
            child: TextFormField(
              //controller: _idController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'BOT ID',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff40A9FF),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Color(0xff021328),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff40A9FF),
              ),
              onPressed: () {
                Get.to(
                  const ShowList(),
                );
              },
              child: const Text(
                'Show list',
                style: TextStyle(
                  color: Color(0xff021328),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
