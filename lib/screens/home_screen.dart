import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/controllers/favorites_controller.dart';
import 'package:getx_firebase/models/product_model.dart';
import 'package:getx_firebase/screens/adres_ekleme.dart';
import 'package:getx_firebase/screens/adress.dart';
import 'package:getx_firebase/screens/credit_cart_screen.dart';
import 'package:getx_firebase/screens/ekranlar/yeni_ekran.dart';
import 'package:getx_firebase/screens/home_page.dart';
import 'package:getx_firebase/screens/login_page.dart';
import 'package:getx_firebase/screens/order_p_c_a.dart';
import 'package:getx_firebase/screens/shopping_cart.dart';

import 'product_detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Demo Trendyol'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ShoppingCartWidget());
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(
              () => UserAccountsDrawerHeader(
                  accountName: Text(userController.userModel.value.name),
                  accountEmail: Text(userController.userModel.value.email)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  userController.signOut();
                },
                icon: const Icon(Icons.exit_to_app),
                color: Colors.teal,
              ),
              title: const Text('Çıkış'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(const CreditCardScreen());
                },
                icon: const Icon(Icons.add),
                color: Colors.teal,
              ),
              title: const Text('Credi cartı sayfasına geç'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => const AdresAdd());
                },
                icon: const Icon(Icons.location_on_outlined),
                color: Colors.teal,
              ),
              title: const Text('Adres Ekeleme sayfası'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => Adress());
                },
                icon: const Icon(Icons.home),
                color: Colors.teal,
              ),
              title: const Text('Adreslerim'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.credit_card),
                color: Colors.teal,
              ),
              title: const Text('Kartlarım'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => OrderScreen());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.orange,
              ),
              title: const Text('Kartlarım'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.orange,
              ),
              title: const Text('Login Ekranı'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => HomePage());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.orange,
              ),
              title: const Text('Anasayfa'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
             ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.to(() => YeniEkran());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
                color: Colors.orange,
              ),
              title: const Text('Obx deneme'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.card_giftcard),
      ),
    );
  }
}
