import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:get/get.dart';

class StatusContrller extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> getordertoid() {
    return FirebaseFirestore.instance
        .collection('order')
        .doc(AppStrings.storage.read('Email'))
        .collection("order-details")
        .snapshots();
  }
}
