import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:uuid/uuid.dart';

class AdressController extends GetxController{
  static AdressController instance = Get.find();

  TextEditingController adresName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController fullAdress = TextEditingController();
  TextEditingController recipientName = TextEditingController();
  
  
  
  
  void adressAdd(){
    try {
      String itemId = const Uuid().v1().toString();
      // ignore: avoid_print
      print('itemId');
      userController.updateUserData(
        {
          "adress" : FieldValue.arrayUnion([
            {
              'id': itemId,
              'adresName':adresName.text.trim(),
              'city':city.text.trim(),
              'district' : district.text.trim(),
              'phoneNumber' : phoneNumber.text.trim(),
              'recipientName' : recipientName.text.trim(),
              'fullAdress' :fullAdress.text.trim(),
              'timeStamp' : Timestamp.now(),
            }
          ]),
          
        }
      );
      Get.snackbar('Adres Eklendi', '${adresName.text.trim()} Adresi başarılı bir şekilde eklendi');
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Hata', 'Tekrar deneyiniz');
    }
  }
  
  
   
}