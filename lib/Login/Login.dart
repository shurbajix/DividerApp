import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _canLogin = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateCanLogin);
    _passwordController.addListener(_updateCanLogin);
  }

  void _updateCanLogin() {
    setState(() {
      _canLogin = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    if (!_canLogin) {
      return;
    }

    String username = _usernameController.text;
    String password = _passwordController.text;

    // Perform login validation
    // Replace the conditions below with your own validation logic

    if (username == 'admin' && password == 'admin') {
      Get.offAllNamed('/Admin');
    } else {
      Get.offAllNamed('/User');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff031428),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(
                    'images/DERIVATIVE.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: _usernameController,
                onChanged: (_) => _updateCanLogin(),
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: _passwordController,
                onChanged: (_) => _updateCanLogin(),
                obscureText: true, // Hide the password input
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(2, 86, 119, 119),
                  ),
                  fillColor: const Color.fromRGBO(9, 45, 81, 81),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('forget password'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _canLogin ? const Color(0xff40A9FF) : Colors.grey,
                ),
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
