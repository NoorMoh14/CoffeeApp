import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_controller.dart';
import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_provider.dart';
import 'package:get/get.dart';

class CoffeeMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<coffeeMenuProvider>(
      coffeeMenuProvider(),
    );

    Get.put<coffeeMenuContrller>(
      coffeeMenuContrller(),
    );
  }
}
