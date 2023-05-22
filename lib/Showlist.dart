import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  var buttonTile = const ListTile();
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
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.powerOff,
            ),
            onPressed: () {
              Get.offAllNamed('/');
            },
          ),
        ],
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
      backgroundColor: const Color.fromRGBO(
        3,
        20,
        40,
        40,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              const Center(
                child: Text(
                  'Users',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 80.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  color: Color(0xff154872),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Slidable(
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            onDismissed: () {},
                          ),
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (BuildContext context) {
                                print('You are click the item');
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 80.w,
                          height: 60,
                          child: const Card(
                            color: Color.fromRGBO(
                              3,
                              20,
                              40,
                              40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcomes',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Center(
                child: Text(
                  'Bots',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 80.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  color: Color(0xff154872),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
