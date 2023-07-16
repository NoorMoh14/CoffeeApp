import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/View/coffeemenu/list/list_coffee.dart';
import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoffeeMenuPage extends StatelessWidget {
  const CoffeeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    return SafeArea(
        child: GetBuilder<coffeeMenuContrller>(
            builder: (controller) => FutureBuilder<void>(
                future: controller.refreshItem(),
                builder: (snap, context) {
                  return Scaffold(
                      key: scaffoldKey,
                      drawer: Drawer(
                        backgroundColor: ColorManagement.colorPrimary,
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.2),
                            child: InkWell(
                              onTap: () =>
                                  scaffoldKey.currentState?.closeDrawer(),
                              child: Text(
                                "Menu",
                                style: TextStyle(
                                    fontSize: FontSize.s30,
                                    color: ColorManagement.colorPrimaryLight),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: PaddingEdit.p20,
                                vertical: PaddingEdit.p20),
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
                                  fontSize: FontSize.s30,
                                  color: ColorManagement.colorPrimaryLight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: PaddingEdit.p20,
                                vertical: PaddingEdit.p20),
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
                                  fontSize: FontSize.s30,
                                  color: ColorManagement.colorPrimaryLight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: PaddingEdit.p20,
                                vertical: PaddingEdit.p20),
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
                                  fontSize: FontSize.s30,
                                  color: ColorManagement.colorPrimaryLight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: PaddingEdit.p20,
                                vertical: PaddingEdit.p20),
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
                                Get.offAndToNamed(PageTo.start);
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: FontSize.s30,
                                  color: ColorManagement.colorPrimaryLight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: PaddingEdit.p20,
                                vertical: PaddingEdit.p20),
                            child: Container(
                              height: 1,
                              width: Get.width,
                              color: ColorManagement.colorPrimaryDark,
                            ),
                          ),
                        ]),
                      ),
                      backgroundColor: const Color(0xff98694F),
                      body: controller.loading != true
                          ? Stack(children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: Get.width,
                                  child: Image.asset(
                                    "assets/image/CoffeeMenu.png",
                                    scale: 1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            if (scaffoldKey
                                                .currentState!.isDrawerOpen) {
                                              scaffoldKey.currentState
                                                  ?.openEndDrawer();
                                            } else {
                                              scaffoldKey.currentState
                                                  ?.openDrawer();
                                            }
                                          },
                                          icon: SvgPicture.asset(
                                              "assets/icons/Menu Stroke.svg"),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          IconButton(
                                              color: const Color(0xff363636),
                                              onPressed: () {
                                                Get.toNamed(PageTo.order);
                                              },
                                              icon: SvgPicture.asset(
                                                "assets/icons/Order - icon.svg",
                                                height: 60,
                                                width: 60,
                                              )),
                                          CircleAvatar(
                                            radius: 11,
                                            backgroundColor: Colors.redAccent,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: TextWidget(
                                                  textAlign: TextAlign.center,
                                                  Title: controller.orderItemLin
                                                      .toString()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Menu",
                                    style: TextStyle(
                                        color: Color(0xffF5EDDA), fontSize: 35),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: controller.refreshItem,
                                      child: GridView.builder(
                                        itemCount: controller.Itemlist!.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 4.0,
                                          mainAxisExtent: Get.height * 0.40,
                                          childAspectRatio:
                                              Get.height / Get.width / 4,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Item_Widget(controller, index);
                                        },
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ])
                          : Center(
                              child: CircularProgressIndicator(),
                            ));
                })));
  }

  Container Item_Widget(coffeeMenuContrller controller, int index) {
    return Container(
      height: Get.height * 0.20,
      width: Get.width * 0.3,
      color: ColorManagement.colorTrans,
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
                    "${controller.Itemlist![index].Price}\$",
                    style: TextStyle(
                        fontSize: FontSize.s12,
                        color: ColorManagement.colorWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
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
            color: ColorManagement.colorPrimaryLight,
            child: Align(
              alignment: Alignment.center,
              child: TextWidget(Title: "Add Cart"),
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 10),
        //   child: Container(
        //     height: 40,
        //     width: Get.width,
        //     color: ColorManagement.colorPrimaryLight,
        //     child: Align(
        //       alignment: Alignment.center,
        //       child: TextWidget(Title: "CheckOut"),
        //     ),
        //   ),
        // )
      ]),
    );
  }
}

//             children: [
//               IconButton(
//                   iconSize: 60,
//                   color: const Color(0xff363636),
//                   onPressed: () {},
//                   icon: SvgPicture.asset("assets/icons/Add Fill.svg")),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Espresso ....................... \$3.00 Single",
//                     style: TextStyle(
//                         color: Color(0xffF5EDDA),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "shot Espresso",
//                     style: TextStyle(color: Color(0xffF5EDDA), fontSize: 15),
//                   ),
//                 ],
//               )
//             ],
//           )