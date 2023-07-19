import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/images_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/Shared/components/text_widget.dart';
import 'package:coffee_app/ViewModel/Profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
          backgroundColor: ColorManagement.colorPrimary,
          body: controller.loading != true
              ? Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            child: FractionallySizedBox(
                              child: Image.asset(
                                BaseImage.coffee_background,
                                fit: BoxFit.fill,
                                opacity: const AlwaysStoppedAnimation(.3),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: SizedBox(
                                width: Get.width,
                                child: Row(
                                  children: [
                                    TextWidget(
                                      Title: 'Order History',
                                      FontSize: FontSize.s18,
                                      colorText:
                                          ColorManagement.colorPrimaryLight,
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                        Get.toNamed(PageTo.status);
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            ColorManagement.colorPrimaryLight,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: ColorManagement.colorPrimary,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        ColorManagement.colorPrimary,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: ColorManagement.colorWhite,
                                    )),
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 5),
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                    color: ColorManagement.colorPrimary,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: PaddingEdit.p10),
                                      child: Icon(
                                        Icons.monetization_on,
                                        color: ColorManagement.colorWhite,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.userlist!.walle,
                                        style: TextStyle(
                                            fontSize: FontSize.s18,
                                            fontFamily:
                                                'Montserrat-VariableFont_wght',
                                            fontWeight: FontWeight.bold,
                                            color: ColorManagement.colorWhite),
                                      ),
                                    ),
                                    Icon(
                                      Icons.panorama_fish_eye_outlined,
                                      color: ColorManagement.colorWhite,
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.userlist!.Point,
                                        style: TextStyle(
                                            fontSize: FontSize.s18,
                                            fontFamily:
                                                'Montserrat-VariableFont_wght',
                                            fontWeight: FontWeight.bold,
                                            color: ColorManagement.colorWhite),
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.17),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(controller.userlist!.Urlimage!),
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.userlist!.full_name,
                              style: TextStyle(
                                fontSize: FontSize.s28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF5EDDA),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.userlist!.Email,
                              style: TextStyle(
                                fontFamily: 'Montserrat-VariableFont_wght',
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize.s16,
                                color: Color(0xFFF5EDDA),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.2,
                            ),
                            //   Container(
                            //     margin: EdgeInsets.fromLTRB(36, 0, 38, 0),
                            //     width: double.infinity,
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Container(
                            //           margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                            //           child: const Text(
                            //             'Order history',
                            //             style: TextStyle(
                            //               fontSize: 28,
                            //               fontWeight: FontWeight.w400,
                            //               height: 1.2,
                            //               color: Color(0xfff5edda),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //           // orderVE7 (10:380)
                            //           margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //           padding: EdgeInsets.fromLTRB(0, 0, 0, 11),
                            //           width: double.infinity,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               Container(
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 2),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       // vf40cce9M1R (10:381)
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 150, 0),
                            //                       child: Text(
                            //                         '#23VF40CCE9',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 14,
                            //                           fontWeight: FontWeight.w700,
                            //                           height: 1.2,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       // ci3 (10:384)
                            //                       '22/01/08',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 14,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1.2,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //               Container(
                            //                 // autogroup4mnwAUf (D3kjFUT954yVjr81f64mnw)
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 213, 0),
                            //                       child: Text(
                            //                         'total order',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 12,
                            //                           fontWeight: FontWeight.w400,
                            //                           height: 1.2,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       // DSw (10:383)
                            //                       '\$39.50',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1.2,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         Divider(
                            //           color: Colors.white,
                            //         ),
                            //         Container(
                            //           margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //           padding: EdgeInsets.fromLTRB(0, 0, 0, 11),
                            //           width: double.infinity,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               Container(
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 2),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 149, 0),
                            //                       child: Text(
                            //                         '#WLVC00FF33',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 14,
                            //                           fontWeight: FontWeight.w700,
                            //                           height: 1.2,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       '22/01/08',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 14,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1.2,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //               Container(
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 10),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 212, 0),
                            //                       child: Text(
                            //                         'total order',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 12,
                            //                           fontWeight: FontWeight.w400,
                            //                           height: 1.2,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       '\$28.50',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         Divider(
                            //           color: Colors.white,
                            //         ),
                            //         Container(
                            //           margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //           padding: EdgeInsets.fromLTRB(0, 0, 0, 11),
                            //           width: double.infinity,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               Container(
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 2),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 148, 0),
                            //                       child: Text(
                            //                         '#334FM00CKA',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 14,
                            //                           fontWeight: FontWeight.w700,
                            //                           height: 1.2000000817,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       '22/01/08',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 14,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1.2000000817,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //               Container(
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 5),
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 208, 0),
                            //                       child: Text(
                            //                         'total order ',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 12,
                            //                           fontWeight: FontWeight.w400,
                            //                           height: 1.2000000477,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       // g31 (10:411)
                            //                       '\$65.00',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w400,
                            //                         height: 1.2,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         Divider(
                            //           color: Colors.white,
                            //           thickness: 4,
                            //         ),
                            //         Container(
                            //           width: double.infinity,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               Container(
                            //                 // line29xB (10:401)
                            //                 margin:
                            //                     EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //                 width: 315,
                            //                 height: 0,
                            //                 child: Image.asset(
                            //                   'assets/image/line-2.png',
                            //                   width: 315,
                            //                   height: 0,
                            //                 ),
                            //               ),
                            //               Container(
                            //                 // autogroupmujh4JT (D3kk3x7hR8GQpDb4nhmUjH)
                            //                 width: double.infinity,
                            //                 child: Row(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       // totalcqm (10:399)
                            //                       margin: EdgeInsets.fromLTRB(
                            //                           0, 0, 230, 0),
                            //                       child: Text(
                            //                         'Total',
                            //                         style: TextStyle(
                            //                           fontFamily: 'Montserrat',
                            //                           fontSize: 14,
                            //                           fontWeight: FontWeight.w700,
                            //                           height: 1.2000000817,
                            //                           color: Color(0xfff5edda),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       // v5m (10:400)
                            //                       '\$133',
                            //                       textAlign: TextAlign.right,
                            //                       style: TextStyle(
                            //                         fontFamily: 'Montserrat',
                            //                         fontSize: 14,
                            //                         fontWeight: FontWeight.w700,
                            //                         height: 1.2000000817,
                            //                         color: Color(0xfff5edda),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
