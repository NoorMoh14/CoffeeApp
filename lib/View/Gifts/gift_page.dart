import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Models/gifts_item_model.dart';
import 'package:coffee_app/Models/user_model.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GiftsPage extends StatefulWidget {
  const GiftsPage({super.key});

  @override
  State<GiftsPage> createState() => _GiftsPageState();
}

class _GiftsPageState extends State<GiftsPage> {
  UserModel? userlistgift;
  List<GiftItemModel>? giftitem;
  @override
  void initState() {
    super.initState();
    userget();
    giftitemget();
  }

  Future<void> userget() async {
    userlistgift = await getUserdata();
    loading = false;
    setState(() {});
  }

  Future<void> giftitemget() async {
    giftitem = await getAllItemdata();
    loading = false;
    setState(() {});
  }

  bool loading = false;
  Future<UserModel?> getUserdata() async {
    loading = true;
    setState(() {});
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: AppStrings.storage.read('Email'))
        .get();
    return snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  }

  Future<List<GiftItemModel>> getAllItemdata() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('gifts-item').get();
    return snapshot.docs.map((e) => GiftItemModel.fromSnapshot(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: ColorManagement.colorPrimaryDark,
        body: giftitem != null
            ? Container(
                height: Get.height,
                width: Get.width,
                color: ColorManagement.colorPrimary.withOpacity(0.5),
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                      Title: "Coffee",
                                      colorText: ColorManagement.colorWhite,
                                      FontSize: FontSize.s26,
                                      FontWeight: FontWeight.normal),
                                  TextWidget(
                                      Title: " App",
                                      colorText: ColorManagement.colorWhite,
                                      FontSize: FontSize.s26,
                                      FontWeight: FontWeight.normal),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: Get.height * 0.1,
                                        width: Get.height * 0.2,
                                        // color: ColorManagement.colorGrey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.wallet,
                                                  size: 35,
                                                  color: ColorManagement
                                                      .colorSecondary,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.3,
                                                  child: TextWidget(
                                                      Title:
                                                          " ${userlistgift!.walle}",
                                                      colorText: ColorManagement
                                                          .colorWhite,
                                                      FontSize: FontSize.s20,
                                                      FontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                            TextWidget(
                                                Title: "Current Ballance",
                                                colorText:
                                                    ColorManagement.colorWhite,
                                                FontSize: FontSize.s18,
                                                FontWeight: FontWeight.normal),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: Get.height * 0.1,
                                        width: Get.height * 0.2,
                                        // color: ColorManagement.colorGrey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .monetization_on_outlined,
                                                  size: 35,
                                                  color: ColorManagement
                                                      .colorSecondary,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.3,
                                                  child: TextWidget(
                                                      Title:
                                                          " ${userlistgift!.Point}",
                                                      colorText: ColorManagement
                                                          .colorWhite,
                                                      FontSize: FontSize.s18,
                                                      FontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                            TextWidget(
                                                Title: "Points",
                                                colorText:
                                                    ColorManagement.colorWhite,
                                                FontSize: FontSize.s18,
                                                FontWeight: FontWeight.normal),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            itemCount: giftitem!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 4.0,
                              mainAxisExtent: Get.height * 0.40,
                              childAspectRatio: Get.height / Get.width / 4,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: Get.height * 0.20,
                                width: Get.width * 0.4,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            ColorManagement.colorPrimaryLight)),
                                child: Column(children: [
                                  Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: ColorManagement.colorTrans,
                                        image: DecorationImage(
                                            // fit: BoxFit.fill,
                                            image: NetworkImage(
                                          giftitem![index].ImageItem.toString(),
                                        ))),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: Get.width * 0.3,
                                        child: Text(
                                          giftitem![index].nameItem.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize.s16,
                                              color:
                                                  ColorManagement.colorWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.wallet,
                                          color: ColorManagement.colorSecondary,
                                        ),
                                        TextWidget(
                                            colorText:
                                                ColorManagement.colorWhite,
                                            Title: giftitem![index]
                                                .cashbackitem
                                                .toString()),
                                        Icon(
                                          Icons.monetization_on_outlined,
                                          color: ColorManagement.colorSecondary,
                                        ),
                                        TextWidget(
                                            colorText:
                                                ColorManagement.colorWhite,
                                            Title: giftitem![index]
                                                .PointItem
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      if (int.parse(giftitem![index]
                                                  .PointItem
                                                  .toString()) <=
                                              int.parse(userlistgift!.Point
                                                  .toString()) &&
                                          double.parse(giftitem![index]
                                                  .cashbackitem
                                                  .toString()) <=
                                              double.parse(userlistgift!.walle
                                                  .toString())) {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) => Center(
                                                  child: QrImageView(
                                                    data: '''
{
  "email": "${userlistgift!.Email}" , 
  "id-item":"${giftitem![index].id}" ,
  "id-user":"${userlistgift!.id}"
}
''',
                                                    size: 300,
                                                  ),
                                                ));
                                      } else {
                                        // print(
                                        //     '${int.parse(giftitem![index].PointItem.toString())}');
                                        // print(
                                        //     '${int.parse(userlistgift!.Point.toString())}');
                                        // print(
                                        //     '${double.parse(giftitem![index].cashbackitem.toString())}');
                                        // print(
                                        //     '${double.parse(userlistgift!.walle.toString())}');
                                        return showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text(
                                              "Not Coin and Wallet",
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                            content: Text(
                                                "Check to Coin and Wallet !"),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text("Ok"),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            ColorManagement.colorPrimaryLight,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: TextWidget(Title: "Give"),
                                      ),
                                    ),
                                  ),
                                ]),
                                // color: ColorManagement.colorBlack,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
