import 'package:coffee_app/ViewModel/About/about_controller.dart';
import 'package:coffee_app/ViewModel/About/about_provider.dart';
import 'package:coffee_app/ViewModel/Status/status_controller.dart';
import 'package:coffee_app/ViewModel/Status/status_provider.dart';
import 'package:get/get.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StatusProvider>(
      StatusProvider(),
    );

    Get.put<StatusContrller>(
      StatusContrller(),
    );
  }
}
