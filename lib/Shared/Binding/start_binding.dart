import 'package:coffee_app/ViewModel/Start/start_controller.dart';
import 'package:coffee_app/ViewModel/Start/start_provider.dart';
import 'package:get/get.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StartProvider>(
      StartProvider(),
    );

    Get.put<StartContrller>(
      StartContrller(),
    );
  }
}
