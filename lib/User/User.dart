import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Dropdownview3.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> itemed = List.generate(51, (index) => '$index');

  int _valueCount = 0;

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.logout,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: SizedBox(
                      width: 78,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff154872),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Count',
                          style: TextStyle(
                            color: Color(0xff186FD0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 40,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Display',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: SizedBox(
                      width: 90,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff154872),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Retrieve',
                          style: TextStyle(
                            color: Color(0xff186FD0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: SizedBox(
                      width: 200,
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
                                        setState(() {
                                          _valueCount = index;
                                        });
                                      },
                                      children:
                                          List.generate(itemed.length, (index) {
                                        return Center(
                                          child: Text(
                                            itemed[index],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      }),
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
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  itemed[_valueCount],
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
                  ),
                ],
              ),
              SizedBox(
                height: 9.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                child: SizedBox(
                  width: 78,
                  height: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff154872),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Store',
                      style: TextStyle(
                        color: Color(0xff186FD0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Space Between Pallets',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: Dropdownview3(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
