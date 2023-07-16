import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Models/item_model.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:get/get.dart';

class coffeeMenuContrller extends GetxController {
  List<ItemModel>? Itemlist;
  int orderItemLin = 0;
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    loading = true;
    update();
    Itemlist = await getAllItemdata();
    // print(Itemlist![0].descrption);
    orderItemLin = await getorderLi();
    loading = false;
    update();
  }

  Future<void> refreshItem() async {
    Itemlist = await getAllItemdata();
    orderItemLin = await getorderLi();
    update();
  }

  bool loading = false;
  Future<List<ItemModel>> getAllItemdata() async {
    final snapshot = await FirebaseFirestore.instance.collection('Item').get();
    return snapshot.docs.map((e) => ItemModel.fromSnapshot(e)).toList();
  }

  Future<int> getorderLi() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Item-order-user')
        .doc(AppStrings.storage.read('Email'))
        .collection("Item")
        .get();
    return snapshot.docs.length;
  }
}
