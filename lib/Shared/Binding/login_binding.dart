import 'package:coffee_app/ViewModel/Login/login_controller.dart';
import 'package:coffee_app/ViewModel/Login/login_provider.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginProvider>(
      LoginProvider(),
    );

    Get.put<LoginContrller>(
      LoginContrller(),
    );
  }
}
