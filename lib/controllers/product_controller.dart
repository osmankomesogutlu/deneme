import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/firebase.dart';
import 'package:getx_firebase/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<ProductModel> product = RxList<ProductModel>([]);
  String colleciton = "product";

  @override
  void onReady() {
    super.onReady();
    product.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(colleciton).snapshots().map(
            (query) => query.docs
                .map((item) => ProductModel.fromMap(item.data()))
                .toList(),
          );

  /* fetchByProductId(){
    
  }
 */

}
