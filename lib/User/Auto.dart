import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

import 'Dropdownview3.dart';

class Auto extends StatefulWidget {
  const Auto({super.key});

  @override
  State<Auto> createState() => _AutoState();
}

class _AutoState extends State<Auto> {
  //here explain count number from 0 to 50
  List<String> itemed = List.generate(
    51,
    (index) => '$index',
  );

  int _valueCount = 0;

  String? selectcm = '5';
  String? valuecm;

  List<String> items = [
    'PS11001',
    'PS11002',
    'PS11003',
    'PS11004',
  ];
  void _createBot() {
    // TODO: create bot with selected bot id and count
  }

  void _deleteBot() {
    // TODO: delete bot with selected bot id
  }

  void _retrieveBot() {
    // TODO: retrieve bot with selected bot id
  }

  void _storeBot() {
    // TODO: store bot with selected spacing
  }
  String? selectedItem = 'PS11001';
  String? valueChoose;
  int selectcount = 1;
  //here explain count number from 0 to 50
  int _valuecount = 0;
  void _Calculatecount() {
    int valuecount = 0;
    for (int i = 1; i <= selectcount; i++) {
      valuecount += i;
    }
    setState(
      () {
        _valuecount = valuecount;
      },
    );
  }

  int _count = 0;

  void _incrementCounter() {
    setState(() {
      if (_count < 50) {
        _count++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }
//--------------------------------------------

// here I will add retrieve button to work with access point

  List userData = [];
  Future _fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
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
                      onPressed: _incrementCounter,
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
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        '20',
                        style: TextStyle(
                          color: Color(0xff186FD0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      onPressed: _fetchData,
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
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Dropdownview3(),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 250,
              ),
              child: Text(
                'Space Between Pallets',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
