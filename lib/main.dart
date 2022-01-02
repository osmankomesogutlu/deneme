import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/adress_controller.dart';
import 'package:getx_firebase/controllers/cart_controller.dart';
import 'package:getx_firebase/controllers/credit_cart_controller.dart';
import 'package:getx_firebase/controllers/favorites_controller.dart';
import 'package:getx_firebase/controllers/order_controller.dart';
import 'package:getx_firebase/controllers/product_controller.dart';
import 'package:getx_firebase/controllers/user_controllers.dart';


import 'screens/login_screens.dart';

void main()async {
   SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value){
      Get.put(UserController());
      Get.put(ProductController());
      Get.put(CartController());
      Get.put(CreditCardController());
      Get.put(AdressController());
      Get.put(FavoritesController());
      Get.put(OrderController());
      
      
    }
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      title: 'Material App',
      home: const LoginScreen(),
    );
  }
}
