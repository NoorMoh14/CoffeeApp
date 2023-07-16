import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/images_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/components/loading_prosses.dart';
import 'package:coffee_app/ViewModel/Loading/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingContrller>(
      builder: (controller) => EasySplashScreen(
        loaderColor: ColorManagement.colorWhiteDark,
        logoWidth: 150,
        logo: Image.asset(BaseImage.logo),
        backgroundColor: ColorManagement.colorPrimary,
        showLoader: true,
        loadingText: Text(
          "Loading...",
          style: TextStyle(
            fontSize: FontSize.s16,
            color: ColorManagement.colorWhiteDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        navigator: controller.screen,
        durationInSeconds: 5,
      ),
    );
  }
}
