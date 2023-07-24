import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container Item_Widget(coffeeMenuContrller controller, int index) {
  return Container(
    height: Get.height * 0.20,
    width: Get.width * 0.4,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: ColorManagement.colorTrans,
      border: Border.all(width: 2, color: ColorManagement.colorPrimaryLight),
    ),
    child: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 5),
        child: Container(
          height: 140,
          width: 100,
          decoration: BoxDecoration(
              color: ColorManagement.colorTrans,
              image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: NetworkImage(
                controller.Itemlist![index].ImageItem.toString(),
              ))),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: Get.width * 0.3,
            child: Text(
              controller.Itemlist![index].nameItem.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s16,
                  color: ColorManagement.colorWhite),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: Get.width * 0.3,
          height: Get.height * 0.05,
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 2),
            child: Text(
              controller.Itemlist![index].descrption.toString(),
              maxLines: 2,
              style: TextStyle(
                  fontSize: FontSize.s14, color: ColorManagement.colorWhite),
            ),
          ),
        ),
      ),
      Spacer(),
      Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 17,
              color: Colors.yellowAccent,
            ),
            SizedBox(
              width: Get.width * 0.1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  controller.Itemlist![index].feedback_star.toString(),
                  style: TextStyle(
                      fontSize: FontSize.s12,
                      color: ColorManagement.colorWhite),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: Get.width * 0.1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "${controller.Itemlist![index].Price}\ JOD",
                  style: TextStyle(
                      fontSize: FontSize.s12,
                      color: ColorManagement.colorWhite),
                ),
              ),
            ),
          ],
        ),
      ),
      Spacer(),
      InkWell(
        onTap: () async {
          await FirebaseFirestore.instance
              .collection('Item-order-user')
              .doc(AppStrings.storage.read('Email'))
              .collection("Item")
              .doc(controller.Itemlist![index].id)
              .set({
            'ImageItem': controller.Itemlist![index].ImageItem,
            'Price': controller.Itemlist![index].Price,
            'descrption': controller.Itemlist![index].descrption,
            'feedback_star': controller.Itemlist![index].feedback_star,
            'nameItem': controller.Itemlist![index].nameItem,
            'quantity': '1'
          });
        },
        child: Container(
          height: 40,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorManagement.colorPrimaryLight,
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextWidget(Title: "Add Cart"),
          ),
        ),
      ),
    ]),
  );
}
