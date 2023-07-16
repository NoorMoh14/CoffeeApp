import 'package:coffee_app/ViewModel/Order/order_controller.dart';
import 'package:coffee_app/ViewModel/Order/order_provider.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderProvider>(
      OrderProvider(),
    );

    Get.put<OrderController>(
      OrderController(),
    );
  }
}
