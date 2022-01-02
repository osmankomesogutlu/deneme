
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/screens/adres_ekleme.dart';
import 'package:getx_firebase/screens/cart_screen.dart';

class ShoppingCartWidget extends StatelessWidget {
 
  const ShoppingCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(child: Text("sepet")),
               SizedBox(
                height: 5,
              ),
              Obx(
                () => Column(
                  children: userController.userModel.value.cart.map((e) => CartItemWidget(cartItem: e)).toList(),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => ElevatedButton(
                  child: Text(
                      "Pay (\$${cartController.totalPrice.value.toStringAsFixed(2)})"),
                  onPressed: () {
                    Get.to(()=>AdresAdd());
                    print(
                        "Pay (\$${cartController.totalPrice.value.toStringAsFixed(2)})");
                    // paymentsController.createPaymentMethod();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
