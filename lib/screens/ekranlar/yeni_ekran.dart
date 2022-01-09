import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/product_model.dart';
import 'package:getx_firebase/screens/product_detail_page.dart';

class YeniEkran extends StatefulWidget {
  const YeniEkran({ Key? key }) : super(key: key);

  @override
  _YeniEkranState createState() => _YeniEkranState();
}

class _YeniEkranState extends State<YeniEkran> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Obx deneme'),
      ),
      body: Obx(
        () => GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .46,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 10,
            children:
                productController.product.map((ProductModel productModel) {
              return InkWell(
                onTap: () {
                  Get.to(()=> ProductDetailPage(productModel: productModel,));
                },
                child: Container(
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
                          maxLines: 2, 
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
                          Obx(
                            () => IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: favoritesController
                                          .isItemAlreadyAdded(productModel)
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {

                                 
                                }),
                          ),
                          IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              onPressed: () {
                                cartController.addProductToCart(productModel);
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}