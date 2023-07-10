import 'package:coffee_app/ViewModel/Loading/loading_controller.dart';
import 'package:coffee_app/ViewModel/Loading/loading_provider.dart';
import 'package:get/get.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoadingProvider>(
      LoadingProvider(),
    );

    Get.put<LoadingContrller>(
      LoadingContrller(),
    );
  }
}
