import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/app_string_constants.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            AppStringConstants.titleText,
            style: TextStyle(color: Colors.blue, fontSize: 50),
          ),
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: userController.email,
                decoration: InputDecoration(
                  focusColor: Colors.yellow,
                  hoverColor: Colors.yellow,
                  hintText: 'Kullanıcı adı veya e-posta girin.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade200.withOpacity(0.3),
                ),
               
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: userController.password,
                decoration: InputDecoration(
                  hintText: 'Şifrenizi girin.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade200.withOpacity(0.3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: () {
                    userController.signIn();
                  },
                  child: const Text('Giriş yap')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const RegisterScreen());
                  },
                  child: const Text('Kayıt ol')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Google ile giriş yap')),
            ),
          ],
        ),
      ),
    );
  }

  
}
