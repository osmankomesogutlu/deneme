import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/models/adres_model.dart';

class Adress extends StatelessWidget {
 
  const Adress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adreslerim'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade100.withOpacity(0.9),
        body: Obx(
          ()=> Column(
            children: userController.userModel.value.adress.map((e) => AdressWidget(adressModel: e)).toList(),
          ),
        ));
  }
}

class AdressWidget extends StatelessWidget {
  final AdressModel adressModel;
   const AdressWidget({
    Key? key,required this.adressModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  size: 35,
                ),
                title:  Text(adressModel.adresName),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey[400],
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(adressModel.recipientName,
                            style: const TextStyle(fontSize: 15)),
                      ),
                       Text(adressModel.phoneNumber, style: const TextStyle(fontSize: 15, )),
                      RichText(
                          text:  TextSpan(children: [
                         TextSpan(
                            text: adressModel.district,
                            style:  const TextStyle(color: Colors.grey)),
                        TextSpan(
                            text: '/'+adressModel.city,
                            style:  const TextStyle(color: Colors.grey))
                      ])),
                       Text(adressModel.fullAdress)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
 /* Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(' Evim '),
                        ),
                        Text('Osman KÖMESÖĞÜTLÜ'),
                      ],
                    ), */