import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../kayit_ol.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 330,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 237,
                    decoration: const BoxDecoration(
                        color: Color(0XFFFF48066e),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white),
                          child: TextField(
                            cursorColor: const Color(0XFFFF48066e),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search_outlined,
                                color: Colors.grey,
                              ),
                              hintText: 'Ürün ara',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.amber.shade600,
                            ),
                            onPressed: () {},
                            iconSize: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ustWidget(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: categories(),
        ),
        Container(
          height: 330,
          width: 400,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Card(
            color: Colors.white38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical:5,horizontal: 15),
                      child: Text(
                        'Ürünler',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'hepsi',
                            style: const TextStyle(fontSize: 15, color: Colors.grey),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // ignore: avoid_print
                                print('Tıklandı');
                              })
                      ])),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      urunlerRow(),
                      urunlerRow(),
                      urunlerRow(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding urunlerRow() {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                offset: const Offset(2, 3),
                                blurRadius: 7)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 180,
                            width: 150,
                            child: Image.network(
                              'https://cdn.dsmcdn.com/mnresize/1200/1800/ty150/product/media/images/20210729/17/113786711/75733271/1/1_org_zoom.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 4, left: 8),
                            child: Text(
                              'Trendyol mila',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.amber),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '850 Tl',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.add_shopping_cart),
                                  onPressed: () {})
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
  }

  Positioned ustWidget() {
    return Positioned(
      top: 180,
      left: 30,
      child: SizedBox(
        height: 145,
        width: 350,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 120,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      'https://cdn.dsmcdn.com/mnresize/1200/1800/ty150/product/media/images/20210729/17/113786711/75733271/1/1_org_zoom.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TRENDYOLMİLLA Antrasit \nFermuarlı Triko Kazak',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        '119,99 TL',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Satın Al'),
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row categories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.amber.shade600,
                  ),
                  onPressed: () {},
                  iconSize: 45,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Erkek'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber.shade600,
                ),
                onPressed: () {},
                iconSize: 45,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Kadın'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber.shade600,
                ),
                onPressed: () {},
                iconSize: 45,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Çocuk'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: IconButton(
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.amber.shade600,
                  ),
                  onPressed: () {},
                  iconSize: 45,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('İndirim'),
          ],
        ),
      ],
    );
  }
}
