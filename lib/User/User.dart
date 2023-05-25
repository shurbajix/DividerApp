import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:derivtive/User/Auto.dart';
import 'package:derivtive/User/Manually.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> itemed = List.generate(51, (index) => '$index');

  final int _valueCount = 0;

  String? selectcm = '5';
  String? valuecm;

  List<String> items = [
    'PS11001',
    'PS11002',
    'PS11003',
    'PS11004',
  ];
  String? selectedItem = 'PS11001';
  String? valueChoose;
  int selectcount = 1;
  int _valuecount = 0;
  void _Calculatecount() {
    int valuecount = 0;
    for (int i = 1; i <= selectcount; i++) {
      valuecount += i;
    }
    setState(() {
      _valuecount = valuecount;
    });
  }

  String _wifiStatus = 'Unknown';
  String _wifiIp = '';

  @override
  void initState() {
    super.initState();
    _checkWifiStatus();
    _getWifiIp();
  }

  Future<void> _checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        _wifiStatus = 'Connected to Wi-Fi';
      });
    } else {
      setState(() {
        _wifiStatus = 'Not connected to Wi-Fi';
      });
    }
  }

  Future<void> _getWifiIp() async {
    for (var interface in await NetworkInterface.list()) {
      if (interface.name == 'wlan0') {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            setState(() {
              _wifiIp = addr.address;
            });
            return;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff031428),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: Image.asset(
                      'images/DERIVATIVE.png',
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BOT ID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: const Color(0xff092D51),
                              height: 250,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'BOT ID',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  CupertinoPicker(
                                    backgroundColor: const Color(0xff092D51),
                                    itemExtent: 90,
                                    onSelectedItemChanged: (int index) {
                                      setState(
                                        () {
                                          _valuecount = index;
                                        },
                                      );
                                    },
                                    children: items.map((String item) {
                                      return Center(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Done',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              items[_valuecount],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff186FD0),
                      ),
                      onPressed: () {
                        Get.to(
                          const Auto(),
                        );
                      },
                      child: const Text(
                        'A automatic',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff021328),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 200,
                    height: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff186FD0),
                      ),
                      onPressed: () {
                        Get.to(
                          const Manually(),
                        );
                      },
                      child: const Text(
                        'M Manual',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff021328),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
