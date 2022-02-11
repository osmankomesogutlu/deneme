import 'package:flutter/material.dart';
import 'package:getx_firebase/models/adres_model.dart';

class AdresGoster extends StatelessWidget {
  final AdressModel adressModel;
  const AdresGoster({ required this.adressModel ,Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int val =1;
    return SizedBox(
      height: 50,
      width: 500,
      child: Card(
        child: ListTile(
          title: Text(adressModel.adresName),
          leading:  Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                  },
                  activeColor: Colors.green,
                ),
        ),
      ),
    );
  }
}