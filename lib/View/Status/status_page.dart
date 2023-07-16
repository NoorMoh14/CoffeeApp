import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/ViewModel/Status/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatusContrller>(
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
            body: Container(
              height: Get.height,
              width: Get.width,
              color: ColorManagement.colorPrimaryLight,
              child: SafeArea(
                  child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.1),
                  child: TextWidget(
                    Title: "Your Status Order",
                    colorText: ColorManagement.colorPrimaryDark,
                    FontSize: FontSize.s30,
                    FontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: PaddingEdit.p10, horizontal: PaddingEdit.p20),
                    child: StreamBuilder(
                        stream: controller.getordertoid(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("No Order"),
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
                                height: Get.height * 0.09,
                                width: Get.width,
                                // color: ColorManagement.colorBlack,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: PaddingEdit.p10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(
                                              Title: "Order ${Index + 1}",
                                              FontSize: FontSize.s16,
                                              colorText:
                                                  ColorManagement.colorPrimary),
                                          Spacer(),
                                          InkWell(
                                              onTap: () {
                                                _showModalBottomSheet(
                                                    context, _documentSnapshot);
                                              },
                                              child: Icon(Icons
                                                  .arrow_circle_right_outlined))
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
              ])),
            )));
  }

  Future<dynamic> _showModalBottomSheet(
      BuildContext context, DocumentSnapshot<Object?> documentSnapshot) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: Get.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(Title: "Order Details"),
                    Row(
                      children: [
                        TextWidget(Title: "Table No : "),
                        TextWidget(Title: "${documentSnapshot['Table-no']}"),
                        Spacer(),
                        TextWidget(Title: "Location : "),
                        TextWidget(Title: "${documentSnapshot['loc']}"),
                      ],
                    ),
                    Row(
                      children: [
                        TextWidget(Title: "Total : "),
                        TextWidget(Title: "${documentSnapshot['Total-Money']}"),
                        Spacer(),
                      ],
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('order')
                            .doc(AppStrings.storage.read('Email'))
                            .collection("order-details")
                            .doc(documentSnapshot.id)
                            .collection('item')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("No Order"),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data == null
                                    ? 0
                                    : snapshot.data!.docs.length,
                                itemBuilder: (context, Index) {
                                  DocumentSnapshot _documentSnapshot =
                                      snapshot.data!.docs[Index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Container(
                                      color: int.parse(_documentSnapshot[
                                                  'status']) >=
                                              2
                                          ? int.parse(_documentSnapshot[
                                                      'status']) >=
                                                  3
                                              ? Colors.greenAccent
                                              : Colors.orangeAccent
                                          : Colors.redAccent,
                                      height: Get.height * 0.09,
                                      width: Get.width * 0.9,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            TextWidget(
                                                Title:
                                                    '${_documentSnapshot['nameItem']}',
                                                colorText:
                                                    ColorManagement.colorBlack),
                                            Spacer(),
                                            TextWidget(
                                                Title:
                                                    'X${_documentSnapshot['quantity']}',
                                                colorText:
                                                    ColorManagement.colorBlack),
                                            if (int.parse(_documentSnapshot[
                                                    'status']) <
                                                2) ...[
                                              InkWell(
                                                onTap: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('order')
                                                      .doc(AppStrings.storage
                                                          .read('Email'))
                                                      .collection(
                                                          "order-details")
                                                      .doc(documentSnapshot.id)
                                                      .collection('item')
                                                      .doc(_documentSnapshot.id)
                                                      .delete();
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Icon(Icons.close),
                                                ),
                                              )
                                            ]
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        })
                  ]),
            ),
          );
        });
  }
}
