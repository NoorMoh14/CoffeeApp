import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/View/coffeemenu/componets/drawer_coffee_menu.dart';
import 'package:coffee_app/ViewModel/CoffeeMenu/coffee_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'componets/Item_widget.dart';

class CoffeeMenuPage extends StatelessWidget {
  const CoffeeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: GetBuilder<coffeeMenuContrller>(
          builder: (controller) => controller.userlist != null
              ? FutureBuilder<void>(
                  future: controller.refreshItem(),
                  builder: (snap, context) {
                    return Scaffold(
                        key: scaffoldKey,
                        drawer: drawer_coffee_menu(scaffoldKey, controller),
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
                                                    Title: controller
                                                        .orderItemLin
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
                                          color: Color(0xffF5EDDA),
                                          fontSize: 35),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: RefreshIndicator(
                                        onRefresh: controller.refreshItem,
                                        child: GridView.builder(
                                          itemCount:
                                              controller.Itemlist!.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 4.0,
                                            mainAxisExtent: Get.height * 0.45,
                                            childAspectRatio:
                                                Get.height / Get.width / 5,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Item_Widget(
                                                controller, index);
                                          },
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ])
                            : Center(
                                child: CircularProgressIndicator(),
                              ));
                  })
              : Scaffold(
                  backgroundColor: ColorManagement.colorPrimary,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
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