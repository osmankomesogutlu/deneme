import 'package:flutter/material.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/screens/adres_goster.dart';
import 'package:getx_firebase/screens/adress.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sipariş Ekranı'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Column(
             children: userController.userModel.value.adress.map((adres) => AdresGoster(adressModel: adres)).toList(),
           )
           
            
          ],
        ),
      ),
    );
  }
}
