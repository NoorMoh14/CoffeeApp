import 'package:coffee_app/ViewModel/Register/register_controller.dart';
import 'package:coffee_app/ViewModel/Register/register_provider.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterProvider>(
      RegisterProvider(),
    );

    Get.put<RegisterContrller>(
      RegisterContrller(),
    );
  }
}
