import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/View/Order/component/screen_Checkout.dart';
import 'package:coffee_app/ViewModel/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (controller) => Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton(
                  backgroundColor: ColorManagement.colorPrimaryLight,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1, color: ColorManagement.colorPrimaryDark),
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorManagement.colorPrimaryDark,
                  )),
            ),
            body: controller.loading != true
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    color: ColorManagement.colorPrimaryLight,
                    child: SafeArea(
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.1),
                          child: TextWidget(
                            Title: "Your Order",
                            colorText: ColorManagement.colorPrimaryDark,
                            FontSize: FontSize.s30,
                            FontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: PaddingEdit.p10,
                                horizontal: PaddingEdit.p20),
                            child: StreamBuilder(
                                stream: controller.getordertoid(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("No Order"),
                                    );
                                  }
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: InkWell(
                                          onTap: () => Get.back(),
                                          child: Text("No order go to menu")),
                                    );
                                  }
                                  return ListView.builder(
                                    itemCount: snapshot.data == null
                                        ? 0
                                        : snapshot.data!.docs.length,
                                    itemBuilder: (context, Index) {
                                      DocumentSnapshot _documentSnapshot =
                                          snapshot.data!.docs[Index];
                                      return Container(
                                        height: Get.height * 0.15,
                                        width: Get.width,
                                        // color: ColorManagement.colorBlack,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: PaddingEdit.p10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 170,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            _documentSnapshot[
                                                                'ImageItem']))),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.6,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: TextWidget(
                                                              Title:
                                                                  _documentSnapshot[
                                                                      'nameItem'],
                                                              colorText:
                                                                  ColorManagement
                                                                      .colorPrimary),
                                                        ),
                                                        // Spacer(),
                                                        // TextWidget(
                                                        //     Title:
                                                        //         _documentSnapshot[
                                                        //             'Price'],
                                                        //     colorText:
                                                        //         ColorManagement
                                                        //             .colorPrimary),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.6,
                                                    child: Row(
                                                      children: [
                                                        Spacer(),
                                                        InkWell(
                                                            onTap: () async {
                                                              int Q = int.parse(
                                                                  _documentSnapshot[
                                                                      'quantity']);
                                                              if (Q > 1) {
                                                                Q = Q - 1;
                                                              }
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Item-order-user')
                                                                  .doc(AppStrings
                                                                      .storage
                                                                      .read(
                                                                          'Email'))
                                                                  .collection(
                                                                      "Item")
                                                                  .doc(
                                                                      _documentSnapshot
                                                                          .id)
                                                                  .update({
                                                                'quantity':
                                                                    Q.toString()
                                                              });
                                                              controller
                                                                  .update();
                                                            },
                                                            child: Icon(
                                                                Icons.remove)),
                                                        TextWidget(
                                                            Title:
                                                                _documentSnapshot[
                                                                    'quantity'],
                                                            colorText:
                                                                ColorManagement
                                                                    .colorPrimary),
                                                        InkWell(
                                                            onTap: () async {
                                                              int Q = int.parse(
                                                                  _documentSnapshot[
                                                                      'quantity']);
                                                              if (Q >= 1) {
                                                                Q = Q + 1;
                                                              }
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Item-order-user')
                                                                  .doc(AppStrings
                                                                      .storage
                                                                      .read(
                                                                          'Email'))
                                                                  .collection(
                                                                      "Item")
                                                                  .doc(
                                                                      _documentSnapshot
                                                                          .id)
                                                                  .update({
                                                                'quantity':
                                                                    Q.toString()
                                                              });
                                                              controller
                                                                  .update();
                                                            },
                                                            child: Icon(
                                                                Icons.add)),
                                                        InkWell(
                                                          onTap: () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Item-order-user')
                                                                .doc(AppStrings
                                                                    .storage
                                                                    .read(
                                                                        'Email'))
                                                                .collection(
                                                                    "Item")
                                                                .doc(
                                                                    _documentSnapshot
                                                                        .id)
                                                                .delete();
                                                            controller.update();
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.6,
                                                    child: Row(
                                                      children: [
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: TextWidget(
                                                              Title:
                                                                  '${_documentSnapshot['Price']} JOD',
                                                              colorText:
                                                                  ColorManagement
                                                                      .colorPrimary),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: FutureBuilder(
                                future: controller.getdataTotal(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<
                                            List<
                                                QueryDocumentSnapshot<
                                                    Map<String, dynamic>>>>
                                        snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("No Order"),
                                    );
                                  }
                                  int length = 0;
                                  if (snapshot.hasData) {
                                    length = snapshot.data!.length;
                                  }

                                  return Container(
                                    height: Get.height * 0.1,
                                    width: Get.width,
                                    color: ColorManagement.colorPrimaryDark,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: SizedBox(
                                            width: Get.width * 0.9,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: TextWidget(
                                                      maxLines: 1,
                                                      Title:
                                                          "Total : ${length}",
                                                      colorText: ColorManagement
                                                          .colorWhite,
                                                      FontSize: FontSize.s18),
                                                ),
                                                Spacer(),
                                                SizedBox(
                                                  width: Get.width * 0.6,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: TextWidget(
                                                            maxLines: 1,
                                                            Title:
                                                                "Total Money: ${controller.sum} JOR",
                                                            colorText:
                                                                ColorManagement
                                                                    .colorWhite,
                                                            FontSize:
                                                                FontSize.s18),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        bottonCheckOut(context, snapshot,
                                            length, controller),
                                      ],
                                    ),
                                  );
                                }))
                      ]),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
