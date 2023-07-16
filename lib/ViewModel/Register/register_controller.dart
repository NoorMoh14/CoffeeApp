import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import 'register_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterContrller extends GetxController {
  final _provider = Get.find<RegisterProvider>();

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    AppStrings.NameCreate.clear();
    AppStrings.PasswordConCreate.clear();
    AppStrings.PasswordCreate.clear();
    AppStrings.EmailCreate.clear();
  }

  Reference referenceImageToUploud = FirebaseStorage.instance
      .ref()
      .child('images')
      .child(DateTime.now().millisecondsSinceEpoch.toString());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String> CreateAccount(String mail, String pwd, String Name,
      String Point, String urlimage) async {
    String? Mass = await _provider.mailRegister(mail, pwd);
    print("Data");
    await users
        .add({
          'full_name': Name,
          'Email': mail,
          'walle': '0.0',
          'Point': Point,
          'Urlimage': urlimage,
        })
        .then((value) => print("User data Added"))
        .catchError(
            (error) => print("User couldn't be added. ${error.toString()}"));
    return Mass!;
  }
}
