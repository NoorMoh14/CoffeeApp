import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Models/user_model.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/ViewModel/Login/login_provider.dart';
import 'package:get/get.dart';

class LoginContrller extends GetxController {
  final _provider = Get.find<LoginProvider>();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getalldata();
    // print(docIds[0]);
    // var data, dataf;
    // final snapshot = await FirebaseFirestore.instance
    //     .collection('users')
    //     .where('Email', isEqualTo: 'mohmad@gmail.com')
    //     .get();
    // //   .then((snapshot) {
    // // if (snapshot.docs.length > 0) {
    // //   dataf = snapshot.docs.first.reference.update({"status": 'Rejected'});
    // // } else {
    // //   data = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    // // }
    // // });
    // print(snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single.Point);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    AppStrings.EmailLogin.clear();
    AppStrings.PasswordLogin.clear();
  }

  List<String> docIds = [];
  Future getalldata() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }));
  }

  bool loadin_login = false;
  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String?> LoginAccount(String mail, String pwd) async {
    loadin_login = true;
    update();
    String? Mass = await _provider.mailSignIn(mail, pwd);
    print("Data Login");
    loadin_login = false;
    update();
    return Mass!;
  }
}
