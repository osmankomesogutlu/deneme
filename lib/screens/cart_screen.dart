import 'package:flutter/material.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: cartItem.image.isNotEmpty ? Image.network(cartItem.image, width: 80,) : null
        ), 
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(cartItem.name)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        cartController.decreaseQuantity(cartItem);
                      }),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cartItem.quantity.toString(),
                      )),
                  IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        cartController.increaseQuantity(cartItem);
                      }),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Text("\$${cartItem.cost.toStringAsFixed(2)}"),
        ),
      ],
    );
  }
}
/* Image.network(
            cartItem.image,
            width: 80,
          ), */