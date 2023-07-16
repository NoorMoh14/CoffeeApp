import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:get/get.dart';

class LoadingContrller extends GetxController {
  String? screen = PageTo.start;
  @override
  void onInit() {
    super.onInit();
    if (AppStrings.storage.read('token') == null) {
      screen = PageTo.start;
    } else {
      screen = PageTo.coffeeMenu;
    }
  }
  // String screen = PageTo.onBoarding;
  // @override
  // void onInit() {
  //   super.onInit();
  //   // screenMangment();
  // }

  // String? showOnBoard = AppStrings.storage.read('ShowOnBoard').toString();
  // String? showhome = AppStrings.storage.read('token').toString();
  // void screenMangment() {
  //   if (showOnBoard == 'true') {
  //     if (showhome!.contains('Bearer') == true) {
  //       if (kDebugMode) {
  //         print(showhome!.contains('Bearer'));
  //       }
  //       screen = PageTo.home;
  //       update();
  //     } else {
  //       screen = PageTo.getStart;
  //       update();
  //     }
  //   } else {
  //     screen = PageTo.onBoarding;
  //     update();
  //   }
  // }
}
