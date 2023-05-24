import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class Manually extends StatefulWidget {
  const Manually({super.key});

  @override
  State<Manually> createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
  final String connectUrl = 'your-api-url/connect';
  final String moveUrl = 'your-apr-url/move';
  Future<void> connectAccessPOint(String ssid, String password) async {
    try {
      final response = await http.post(
        Uri.parse(connectUrl),
        body: {
          'ssid': ssid,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('Connected to $ssid');
      } else {
        print('Failed to connect to $ssid:${response.statusCode}');
      }
    } catch (e) {
      print('Failed to connect to $ssid:$e');
    }
  }

  Future<void> moveRobot(String direction) async {
    try {
      final response = await http.post(Uri.parse(moveUrl), body: {
        'direction': direction,
      });
      if (response.statusCode == 200) {
        print('Robot moved $direction');
      } else {
        print('Faild to move robot: ${response.statusCode}');
      }
    } catch (e) {
      print('Faild to move robot: $e');
    }
  }

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
                  String direction = '';
                  if (index == 0) {
                    direction = 'F';
                  } else if (index == 1) {
                    direction = 'B';
                  } else if (index == 2) {
                    direction = 'U';
                  } else if (index == 3) {
                    direction = 'D';
                  }
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
                      onPressed: () {
                        if (index == 0 ||
                            index == 1 ||
                            index == 2 ||
                            index == 3) {
                          moveRobot(direction);
                        } else if (index == 4) {
                          const String ssid =
                              'your-ssid'; // REPLACE WITH DESIRED SSID
                          const String password =
                              'your-password'; //REPLACE WITH THE DESRIED PASSWORD
                          connectAccessPOint(ssid, password);
                        }
                      },
                      child: Text(
                        index == 0
                            ? 'F'
                            : index == 1
                                ? 'B'
                                : index == 2
                                    ? ' U'
                                    : index == 3
                                        ? 'D'
                                        : 'Connect to Access Point',
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
