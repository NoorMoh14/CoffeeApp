import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Models/user_model.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserModel? userlist;
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    userlist = await getUserdata();
    loading = false;
    update();
  }

  bool loading = false;
  Future<UserModel> getUserdata() async {
    loading = true;
    update();
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: AppStrings.storage.read('Email'))
        .get();
    return snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
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
}
