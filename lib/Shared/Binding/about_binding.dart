import 'package:coffee_app/ViewModel/About/about_controller.dart';
import 'package:coffee_app/ViewModel/About/about_provider.dart';
import 'package:get/get.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutProvider>(
      AboutProvider(),
    );

    Get.put<AboutContrller>(
      AboutContrller(),
    );
  }
}
