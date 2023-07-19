import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawer_coffee_menu(
    GlobalKey<ScaffoldState> scaffoldKey, coffeeMenuContrller controller) {
  return Drawer(
    backgroundColor: ColorManagement.colorPrimary,
    child: Column(children: [
      Padding(
        padding:
            EdgeInsets.only(top: Get.height * 0.08, bottom: Get.height * 0.15),
        child: Container(
          height: Get.height * 0.05,
          width: Get.width * 0.4,
          decoration: BoxDecoration(
              color: ColorManagement.colorPrimaryLight,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: PaddingEdit.p10),
                child: Icon(
                  Icons.monetization_on,
                  color: ColorManagement.colorPrimary,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.userlist!.walle,
                  style: TextStyle(
                      fontSize: FontSize.s18,
                      fontFamily: 'Montserrat-VariableFont_wght',
                      fontWeight: FontWeight.bold,
                      color: ColorManagement.colorPrimary),
                ),
              ),
              Icon(
                Icons.panorama_fish_eye_outlined,
                color: ColorManagement.colorPrimary,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.userlist!.Point,
                  style: TextStyle(
                      fontSize: FontSize.s18,
                      fontFamily: 'Montserrat-VariableFont_wght',
                      fontWeight: FontWeight.bold,
                      color: ColorManagement.colorPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () => scaffoldKey.currentState?.closeDrawer(),
        child: Text(
          "Menu",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
      InkWell(
        onTap: () {
          Get.toNamed(PageTo.profile);
        },
        child: Text(
          "Profile",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
      InkWell(
        onTap: () => Get.toNamed(PageTo.gift),
        child: Text(
          "Gifts",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
      InkWell(
        onTap: () {
          Get.toNamed(PageTo.status);
        },
        child: Text(
          "Status",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
      InkWell(
        onTap: () {
          Get.toNamed(PageTo.about);
        },
        child: Text(
          "About",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
      InkWell(
        onTap: () async {
          try {
            await FirebaseAuth.instance.signOut();
            AppStrings.storage.remove('Email');
            AppStrings.storage.remove('token');
            Get.offAllNamed(PageTo.start);
          } catch (e) {
            print(e);
          }
        },
        child: Text(
          "Log Out",
          style: TextStyle(
              fontSize: FontSize.s30, color: ColorManagement.colorPrimaryLight),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingEdit.p20, vertical: PaddingEdit.p20),
        child: Container(
          height: 1,
          width: Get.width,
          color: ColorManagement.colorPrimaryDark,
        ),
      ),
    ]),
  );
}
