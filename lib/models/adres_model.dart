import 'package:cloud_firestore/cloud_firestore.dart';

class AdressModel {
  late String id;
  late String adresName;
  late String city;
  late String district;
  late String phoneNumber;
  late String recipientName;
  late String fullAdress;
  late Timestamp timeStamp;

  AdressModel({
    required this.id,
    required this.adresName,
    required this.city,
    required this.district,
    required this.phoneNumber,
    required this.recipientName,
    required this.fullAdress,
    required this.timeStamp,
  });

  AdressModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    adresName = data["adresName"];
    city = data["city"];
    district = data["district"];
    phoneNumber = data["phoneNumber"];
    recipientName = data["recipientName"];
    fullAdress = data["fullAdress"];
    timeStamp = data["timeStamp"];
  }

  Map toJson() => {
        'id': id,
        'adresName': adresName,
        'city': city,
        'district': district,
        'phoneNumber': phoneNumber,
        'recipientName': recipientName,
        'fullAdress': fullAdress,
        'timeStamp': timeStamp,
      };
}
