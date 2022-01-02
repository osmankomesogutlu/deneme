/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartSayfasi extends StatefulWidget {
  const CartSayfasi({ Key? key }) : super(key: key);

  @override
  _CartSayfasiState createState() => _CartSayfasiState();
}

class _CartSayfasiState extends State<CartSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(
        () => GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .46,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 10,
            children:
                productController.product.map((ProductModel productModel) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          offset: const Offset(3, 2),
                          blurRadius: 7)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            productModel.images[0],
                            width: double.infinity,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productModel.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // this will show dots(...) after 2 lines
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            text: productModel.description),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            productModel.price.toString() + " TL",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              cartController.veriekle(productModel);
                            })
                      ],
                    ),
                  ],
                ),
              );
            }).toList()),
      ),,
    );
  }
} */