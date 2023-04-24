import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class Admin extends StatefulWidget {
  const Admin({
    super.key,
  });

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final TextEditingController _textController = TextEditingController();

  Future<void> _createUserGenerator() async {
    var url = Uri.parse('http://<access_point_ip>/users/create');

    var body = {'name': _textController.text};

    var response = await http.post(url, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> _deleteUserGenerator() async {
    var url = 'http://<access_point_ip>/users/delete';
    var body = {'id': _textController.text};

    var response = await http.post(url as Uri, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  //Bot Generator
  final _ipController = TextEditingController();
  final _idController = TextEditingController();

  Future<void> _createBot() async {
    var ip = _ipController.text;
    var botId = _idController.text;

    var url = Uri.parse('http://$ip/bots/create');
    var body = {'id': botId};

    var response = await http.post(url, body: body);
    print('Create bot response status: ${response.statusCode}');
    print('Create bot response body: ${response.body}');
  }

  Future<void> _deleteBot() async {
    var ip = _ipController.text;
    var botId = _idController.text;

    var url = Uri.parse('http://$ip/bots/delete');
    var body = {'id': botId};

    var response = await http.post(url, body: body);
    print('Delete bot response status: ${response.statusCode}');
    print('Delete bot response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 60,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          height: 5.h,
        ),
        SizedBox(
          width: 70.w,
          child: Form(
            //key: _formKey,
            child: TextFormField(
              controller: _textController,
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
                onPressed: _createUserGenerator,
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Color(0xff021328),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 30.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff033B68),
                ),
                onPressed: _deleteUserGenerator,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Color(0xff40A8FF),
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
          height: 5.h,
        ),
        SizedBox(
          width: 70.w,
          child: TextFormField(
            controller: _ipController,
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
          height: 5.h,
        ),
        SizedBox(
          width: 70.w,
          child: TextFormField(
            controller: _idController,
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
                onPressed: _createBot,
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Color(0xff021328),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 30.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff033B68),
                ),
                onPressed: _deleteBot,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Color(0xff40A8FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
