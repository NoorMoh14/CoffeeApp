import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProvider extends DisposableInterface {
  Future<String?> mailRegister(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
      return 'Done Create Account';
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }
}
