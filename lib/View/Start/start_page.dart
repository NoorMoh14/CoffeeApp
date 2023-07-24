import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/images_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            color: ColorManagement.colorBlack,
            image: DecorationImage(
                opacity: 0.3,
                fit: BoxFit.fill,
                image: AssetImage(BaseImage.background_start))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.10),
              child: Container(
                height: Get.height * 0.35,
                width: Get.height * .35,
                decoration: BoxDecoration(
                    color: ColorManagement.colorTrans,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(BaseImage.logo))),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () => Get.toNamed(PageTo.login),
              child: Container(
                height: Get.height * 0.08,
                width: Get.width * 0.65,
                decoration: BoxDecoration(
                    color: ColorManagement.colorPrimaryLight,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: TextWidget(
                      Title: "Login",
                      colorText: ColorManagement.colorPrimary,
                      FontSize: FontSize.s24),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: PaddingEdit.p10, bottom: PaddingEdit.p20),
              child: InkWell(
                onTap: () => Get.toNamed(PageTo.regester),
                child: TextWidget(
                  Title: "Register Me!",
                  colorText: ColorManagement.colorPrimaryLight,
                  customFont: 'Montserrat-VariableFont_wght',
                  FontWeight: FontWeight.bold,
                  FontSize: FontSize.s16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
