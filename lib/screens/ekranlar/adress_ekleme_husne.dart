import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/controllers.dart';
import 'package:getx_firebase/screens/credit_cart_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AdresEkle extends StatefulWidget {
  const AdresEkle({Key? key}) : super(key: key);

  @override
  _AdresEkleState createState() => _AdresEkleState();
}

class _AdresEkleState extends State<AdresEkle> {
  var maskFormatter = MaskTextInputFormatter(
      mask: ' # (###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFFF48066e),
        title: const Text(
          'Adres Ekle',
          style: TextStyle(fontSize: 22),
        ),
      ),
      backgroundColor: Colors.grey.shade100.withOpacity(0.9),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: buildTextFormPerson(context),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: buildTextFormAdres(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    adressController.adressAdd();
                    Get.to(()=>const CreditCardScreen());
                  },
                  child: const Text(
                    'Kaydet',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(40, 50), primary: Colors.teal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildTextFormPerson(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'İletişim Bilgileri',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: adressController.recipientName,
            decoration: InputDecoration(
                labelText: "Ad Soyad",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 20),
          child: TextField(
            controller: adressController.phoneNumber,
            inputFormatters: [maskFormatter],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Cep Telefonu",
              hintText: "0 555 555 55 55",
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column buildTextFormAdres(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Adres Bilgileri',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: adressController.city,
            decoration: InputDecoration(
                labelText: "İl",
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: adressController.district,
            decoration: InputDecoration(
              labelText: "İlçe",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: adressController.fullAdress,
            maxLines: 2,
            decoration: InputDecoration(
              
                labelText: "Tam Adres",
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 30),
          child: TextField(
            controller: adressController.adresName,
            decoration: InputDecoration(
                labelText: "Adres Başlığı",
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
