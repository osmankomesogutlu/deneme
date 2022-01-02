import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/screens/kayit_ol.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
    /*     title: const Text(
          'Giriş Yap',
          style: TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w800, fontSize: 25),
        ), */
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 50),
              child: Image.asset('assets/images/husnesakalli4.png'),
            )),
            const Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 30, right: 30, bottom: 10),
              child: Text(
                'E-posta',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'ornek@eposta.com',
                  hintStyle: const TextStyle(fontSize: 17),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 30, right: 30, bottom: 10),
              child: Text(
                'Şifre  ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
              child: TextField(
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: '***********',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: const Color(0XFFFF48066e),
                    fixedSize: const Size(303, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5,bottom: 20,left: 30,right: 30),
              child: Center(
                child:  RichText(
                  text:  TextSpan(
                    children: [
                       TextSpan(
                        text: 'Bir hesabınız yok mu? ',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                        TextSpan(
                        text: 'Kayıt Ol',
                        style: TextStyle(color:Color(0XFFFF48066e),fontWeight: FontWeight.bold),
                        recognizer:  TapGestureRecognizer()..onTap = () {
                          Get.to(()=> RegisterPage());
                          print('Tıklandı');
                        }
                      ),
                    ]
                  ) ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
