import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginProvider extends DisposableInterface {
  Future<String?> mailSignIn(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd);
      AppStrings.storage.write('token', FirebaseAuth.instance.currentUser!.uid);
      return 'Done Login Account';
    } on FirebaseAuthException catch (ex) {
      print('Errro');
      print(ex.message);
      return "${ex.message}";
    }
  }
}
