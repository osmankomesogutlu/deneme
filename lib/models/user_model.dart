import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_firebase/models/adres_model.dart';
import 'package:getx_firebase/models/cart_model.dart';
import 'package:getx_firebase/models/credit_card_model.dart';
import 'package:getx_firebase/models/favorite_model.dart';

class UserModel {
  late String id;
  late String name;
  late String email;
  late Timestamp timeStamp;
  late List<CartModel> cart;
  late List<CardModel> creditCard;
  late List<AdressModel> adress;
  late List<FavoriteModel> favorite;
  

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.timeStamp,
    required this.cart,
    required this.creditCard,
    required this.adress,
    required this.favorite,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    email = snapshot['email'];
    timeStamp = snapshot['timeStamp'];
    cart = _convertCartItems(snapshot['cart'] ?? [].cast<CartModel>());
    creditCard = _convertCardItems(snapshot['creditCard'] ?? [].cast<CardModel>());
    adress = _convertAdressItems(snapshot['adress'] ?? [].cast<AdressModel>());
    favorite = _convertFavoriteItems(snapshot['favorite'] ?? [].cast<FavoriteModel>());
  }
 
   /* factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot['id'],
      name: snapshot['name'],
      email: snapshot['email'],
      timeStamp: snapshot['timeStamp'],
      cart: snapshot['cart'] ?? [].cast<CartModel>(),
    );
  }   */

  List<CartModel> _convertCartItems(List cartFomDb) {
    List<CartModel> _result = [];
    if (cartFomDb.isNotEmpty) {
      for (var element in cartFomDb) {
        _result.add(CartModel.fromMap(element));
      }
    }
    return _result;
  }


  List<CardModel> _convertCardItems(List cardDb){
    List<CardModel> _resultCard = [];
    if(cardDb.isNotEmpty){
      for(var item in cardDb){
        _resultCard.add(CardModel.fromMap(item));
      }
    }
    return _resultCard;
  }
  List<AdressModel> _convertAdressItems(List adressDb){
    List<AdressModel> _resultAdress = [];
    if(adressDb.isNotEmpty){
      for(var item in adressDb){
        _resultAdress.add(AdressModel.fromMap(item));
      }
    }
    return _resultAdress;
  }
   List<FavoriteModel> _convertFavoriteItems(List favoriteDb){
    List<FavoriteModel> _resultFavorite = [];
    if(favoriteDb.isNotEmpty){
      for(var item in favoriteDb){
        _resultFavorite.add(FavoriteModel.fromMap(item));
      }
    }
    return _resultFavorite;
  }



  List cartItemToJson() => cart.map((item) => item.toJson()).toList();
}
