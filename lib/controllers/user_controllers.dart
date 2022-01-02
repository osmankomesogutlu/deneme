import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/constants/firebase.dart';
import 'package:getx_firebase/helpers/show_loading.dart';
import 'package:getx_firebase/models/user_model.dart';
import 'package:getx_firebase/screens/home_screen.dart';
import 'package:getx_firebase/screens/login_screens.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel(
      id: '',
      name: '',
      email: '',
      timeStamp: Timestamp.now(),
      cart: [],
      creditCard: [],
      adress: [], favorite: []).obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String userCollection = 'users';

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => const HomeScreen());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _initializeUserModel(_userId);
      });
    } catch (e) {
      dismissLoadingWidget();
      debugPrint(e.toString());
      Get.snackbar('Giriş Başarısız', 'Tekrar Dene');
    }
  }

  void signUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
      });
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();
      if (e.code == 'weak-password') {
        Get.snackbar('Zayıf Şifre', 'Sağlanan şifre zayıf');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('E-posta Kayıtlı', 'E-posta sistemde kayıtlı');
      }
      
    } catch (e) {
      dismissLoadingWidget();
      debugPrint(e.toString());
      Get.snackbar('Kayıt Başarısız', 'Tekrar Dene');
    }
  }

  void signOut() {
    auth.signOut();
  }

  _addUserToFirestore(String _userId) {
    firebaseFirestore.collection(userCollection).doc(_userId).set({
      "name": name.text.trim(),
      "email": email.text.trim(),
      "id": _userId,
      "timeStamp": Timestamp.now(),
      "cart": [],
      "adress": [],
      "creditCard": [],
      "favorite":[],
    });
  }

  _initializeUserModel(String _userId) async {
    userModel.value = await firebaseFirestore
        .collection(userCollection)
        .doc(_userId)
        .get()
        .then(
          (doc) => UserModel?.fromSnapshot(doc),
        );
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(userCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(userCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
