import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Models/item_model.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<ItemModel?>? orderlist;
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    orderlist = await getOrderdata();
    // print(orderlist![0]?.feedback_star);
    loading = false;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    AppStrings.TableNo.clear();
  }

  bool loading = false;
  Future<dynamic> getOrderdata() async {
    loading = true;
    update();
    final snapshot = await FirebaseFirestore.instance
        .collection('Item-order-user')
        .doc(AppStrings.storage.read('Email'))
        .collection('Item')
        .get();

    return snapshot.docs.map((e) => ItemModel.fromSnapshot(e)).toList();
  }

  double sum = 0;
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getdataTotal() async {
    sum = 0;
    QuerySnapshot<Map<String, dynamic>> snap = await FirebaseFirestore.instance
        .collection('Item-order-user')
        .doc(AppStrings.storage.read('Email'))
        .collection("Item")
        .get();

    for (var i = 0; i < snap.docs.length; ++i) {
      double total = double.parse(snap.docs[i]['Price']) *
          double.parse(snap.docs[i]['quantity']);
      print(total);
      sum = sum + total;
      print(sum);
    }
    print(snap.docs.toList()[0]['quantity']);
    return snap.docs.toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? _document;
  Stream<QuerySnapshot<Map<String, dynamic>>> getordertoid() {
    _document = FirebaseFirestore.instance
        .collection('Item-order-user')
        .doc(AppStrings.storage.read('Email'))
        .collection("Item")
        .snapshots();
    return _document!;
  }

  void Checkoutorder(List<QueryDocumentSnapshot<Map<String, dynamic>>>? data,
      int Tableno, var rand, var total) async {
    await FirebaseFirestore.instance
        .collection('order')
        .doc(AppStrings.storage.read('Email'))
        .collection("order-details")
        .doc('${rand}')
        .set({
      'Table-no': '${Tableno.toString()}',
      'time': '${DateTime.now().toString()}',
      'Total-Money': '${total.toString()}',
      'loc': 'Aqaba',
      'lon': '',
      'lan': ''
    });
    for (var i = 0; i < data!.length; i++) {
      await FirebaseFirestore.instance
          .collection('order')
          .doc(AppStrings.storage.read('Email'))
          .collection("order-details")
          .doc('${rand}')
          .collection('item')
          .doc('${rand}${i}');
      await FirebaseFirestore.instance
          .collection('order')
          .doc(AppStrings.storage.read('Email'))
          .collection("order-details")
          .doc('${rand}')
          .collection('item')
          .doc('${rand}${i}')
          .set({
        'nameItem': data[i]['nameItem'].toString(),
        'quantity': data[i]['quantity'].toString(),
        'status': '1',
        'Email': AppStrings.storage.read('Email'),
        'id-item': '${rand}${i}',
        'id-order': '${rand}',
      });

      // Map<String, dynamic> location = {
      //   'Addrees': 'Amman',
      //   'Table-no': '${Tableno.toString()}',
      //   'lan': '',
      //   'loc': '',
      // };
      // Map<String, dynamic> time = {
      //   'day': '${DateTime.now().day}',
      //   'time': '${DateTime.now().toString()}',
      // };
      // Map<String, dynamic> user = {
      //   'email': '${AppStrings.storage.read('Email')}',
      //   'total': '${total.toString()}',
      //   'quantity': data[i]['quantity'].toString(),
      // };
      // await FirebaseFirestore.instance
      //     .collection('order')
      //     .doc(AppStrings.storage.read('Email'))
      //     .collection("order-details")
      //     .add({
      //   'ImageItem': data[i]['ImageItem'].toString(),
      //   'Price': data[i]['Price'].toString(),
      //   'location': location,
      //   'nameItem': data[i]['nameItem'].toString(),
      //   'status': '1',
      //   'time': time,
      //   'user-information': user,
      // });

      await FirebaseFirestore.instance
          .collection('Item-order-user')
          .doc(AppStrings.storage.read('Email'))
          .collection('Item')
          .doc(data[i].id)
          .delete();
    }
    update();
    print('End');
  }
  // List<String> docIds = [];
  // Future getalldata() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             print(element.reference);
  //             docIds.add(element.reference.id);
  //           }));
  // }
}
