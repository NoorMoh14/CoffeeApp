import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/ViewModel/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

InkWell bottonCheckOut(
    BuildContext context,
    AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapshot,
    int length,
    OrderController controller) {
  return InkWell(
    onTap: () {
      showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
                initialChildSize: 0.90, //set this as you want
                maxChildSize: 0.90, //set this as you want
                minChildSize: 0.90, //set this as you want
                expand: true,
                builder: (context, scrollController) {
                  return Form(
                    key: AppStrings.OrderCheckoutFromKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                // color: ColorManagement.colorBlack,
                                child: TextWidget(
                                    maxLines: 1,
                                    Title: "Order details",
                                    colorText: ColorManagement.colorBlack,
                                    FontSize: FontSize.s18),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                // color: ColorManagement.colorGrey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20, top: 10),
                                        child: TextWidget(
                                            maxLines: 1,
                                            Title: "Table Number : ",
                                            colorText:
                                                ColorManagement.colorBlack,
                                            FontSize: FontSize.s18),
                                      ),
                                      TextFormField(
                                        validator: (v) =>
                                            num.tryParse(v.toString()) == null
                                                ? "invalid number"
                                                : null,
                                        controller: AppStrings.TableNo,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          // for below version 2 use this
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                          // for version 2 and greater youcan also use this
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          hintText: "Table Number",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3,
                                                color: ColorManagement
                                                    .colorPrimary), //<-- SEE HERE
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: snapshot.data!.reversed
                                        .map((e) => Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Row(
                                                children: [
                                                  Text('${e['nameItem']}'),
                                                  Spacer(),
                                                  Text(
                                                      '${e['Price']} x ${e['quantity']}'),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                // color: ColorManagement.colorGrey,
                                child: Column(
                                  // verticalDirection: VerticalDirection.up,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 5,
                                        width: Get.width,
                                        color: ColorManagement.colorBlack,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                            maxLines: 1,
                                            Title: "Total : ${length}",
                                            colorText:
                                                ColorManagement.colorBlack,
                                            FontSize: FontSize.s18),
                                        Spacer(),
                                        SizedBox(
                                          width: Get.width * 0.6,
                                          child: TextWidget(
                                              maxLines: 1,
                                              Title:
                                                  "Total Money: ${controller.sum}",
                                              colorText:
                                                  ColorManagement.colorBlack,
                                              FontSize: FontSize.s18),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: InkWell(
                                        onTap: () {
                                          AppStrings
                                              .OrderCheckoutFromKey.currentState
                                              ?.save();
                                          if (AppStrings.OrderCheckoutFromKey
                                              .currentState!
                                              .validate()) {
                                            controller.Checkoutorder(
                                                snapshot.data,
                                                int.parse(
                                                    AppStrings.TableNo.text),
                                                '${DateTime.now().millisecondsSinceEpoch.toString()}',
                                                controller.sum);
                                            Get.snackbar('Sucssed',
                                                ' monitoring to order to Page Status',
                                                duration:
                                                    const Duration(seconds: 1),
                                                backgroundColor:
                                                    Colors.green[900],
                                                colorText:
                                                    ColorManagement.colorWhite);
                                            AppStrings.TableNo.clear();
                                            Navigator.of(context).pop();
                                            Get.back();
                                            Get.toNamed(PageTo.coffeeMenu);
                                            Get.toNamed(PageTo.status);
                                          } else {
                                            Get.snackbar('Failed',
                                                ' Variables are not entered check the information',
                                                duration:
                                                    const Duration(seconds: 1),
                                                backgroundColor:
                                                    Colors.red[900],
                                                colorText:
                                                    ColorManagement.colorWhite);
                                          }
                                        },
                                        child: Container(
                                          height: Get.height * 0.07,
                                          color: ColorManagement.colorBlack,
                                          width: Get.width,
                                          child: Center(
                                            child: TextWidget(
                                                Title: 'CheckOut Order',
                                                colorText:
                                                    ColorManagement.colorWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ); //whatever you're returning, does not have to be a Container
                });
          });
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      // margin: EdgeInsets.all(30),
      height: Get.height * 0.05,
      width: Get.width,
      color: ColorManagement.colorPrimaryLight,
      child: Center(child: TextWidget(Title: 'Checkout Order')),
    ),
  );
}
