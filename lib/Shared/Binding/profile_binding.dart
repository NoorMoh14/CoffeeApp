import 'package:coffee_app/ViewModel/Profile/profile_controller.dart';
import 'package:coffee_app/ViewModel/Profile/profile_provider.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileProvider>(
      ProfileProvider(),
    );

    Get.put<ProfileController>(
      ProfileController(),
    );
  }
}
