import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:getx_firebase/models/product_model.dart';
import 'package:getx_firebase/widgets/slider.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailPage({Key? key, required this.productModel})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
          //  width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
              )
            ], borderRadius: BorderRadius.circular(30), color: Colors.grey.withOpacity(0.1)),
            child: Stack(
              children: <Widget>[
                FadeInDown(
                  child: ProductSlider(
                    items: widget.productModel.images,
                  ),
                ),
                SafeArea(
                  child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color:Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          
          const SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 350),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.productModel.name,
                style: const TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w600, height: 1.5,color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
               widget.productModel.price.toString()+  "\₺" ,
                style: const TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w500, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: FadeInDown(
                delay: const Duration(milliseconds: 450),
                child: Text(
                  widget.productModel.description,
                 
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              )),
          const SizedBox(
            height: 25,
          ),
          
          const SizedBox(
            height: 50,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 550),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        color: const Color(0XFFFF48066e)),
                    child: const Center(
                      child: const Icon(Icons.favorite,color: Colors.white,),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                         primary:const Color(0XFFFF48066e),
                         ),
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            child: const Center(
                              child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
