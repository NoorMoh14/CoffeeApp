import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/string_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:coffee_app/ViewModel/Register/register_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class RegsterPage extends StatefulWidget {
  const RegsterPage({super.key});

  @override
  State<RegsterPage> createState() => _RegsterPageState();
}

class _RegsterPageState extends State<RegsterPage> {
  bool? isChecked = false;
  File? _file;
  String? UrlImage = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterContrller>(
        builder: (controller) => SafeArea(
                child: Form(
              key: AppStrings.signUpFromKey,
              child: Scaffold(
                  // resizeToAvoidBottomInset: false,
                  backgroundColor: Color(0xff363636),
                  body: loading != true
                      ? Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(PaddingEdit.p20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 13,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      size: 35,
                                      color: ColorManagement.colorWhite,
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: PaddingEdit.p20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: Get.height * 0.02),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: PaddingEdit.p20),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Create Account ',
                                            style: TextStyle(
                                              fontSize: FontSize.s34,
                                              color: ColorManagement.colorWhite,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      _file == null
                                          ? InkWell(
                                              onTap: () async {
                                                // showModalBottomSheet(
                                                //     context: context,
                                                //     builder: (context) => SizedBox(
                                                //           height: Get.height * 0.3,
                                                //         ));
                                                final ImagePicker picker =
                                                    ImagePicker();
                                                final XFile? photo =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.camera);

                                                if (photo != null) {
                                                  setState(() {
                                                    _file = File(photo.path);
                                                  });
                                                }
                                                // final File image = photo.;
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundColor:
                                                      ColorManagement
                                                          .colorPrimaryLight,
                                                  child: Icon(
                                                    Icons.add,
                                                    color: ColorManagement
                                                        .colorPrimary,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundImage:
                                                        FileImage(_file!),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: PaddingEdit.p14),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      child: Icon(Icons.remove),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                      SizedBox(height: Get.height * 0.02),
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: FontSize.s16,
                                          color: ColorManagement.colorWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15, top: 10),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty)
                                              return "please Check the Name";
                                            return null;
                                          },
                                          controller: AppStrings.NameCreate,
                                          style:
                                              TextStyle(fontSize: FontSize.s12),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffF5EDDA),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                          fontSize: FontSize.s16,
                                          color: ColorManagement.colorWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15, top: 10),
                                        child: TextFormField(
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(
                                                      email)
                                              ? " please Check the Email"
                                              : null,
                                          controller: AppStrings.EmailCreate,
                                          style: TextStyle(
                                            fontSize: FontSize.s12,
                                          ),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorManagement
                                                .colorPrimaryLight,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                          fontSize: FontSize.s16,
                                          color: ColorManagement.colorWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15, top: 10),
                                        child: TextFormField(
                                          obscureText: true,
                                          validator: (passCurrentValue) {
                                            RegExp regex = RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                                            var passNonNullValue =
                                                passCurrentValue ?? "";
                                            if (passNonNullValue.isEmpty) {
                                              return "Password is required";
                                            } else if (passNonNullValue.length <
                                                6) {
                                              return "Password Must be more than 5 characters";
                                            } else if (!regex
                                                .hasMatch(passNonNullValue)) {
                                              return "Password should contain upper,lower,digit and Special character ";
                                            }
                                            return null;
                                          },
                                          controller: AppStrings.PasswordCreate,
                                          style:
                                              TextStyle(fontSize: FontSize.s12),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorManagement
                                                .colorPrimaryLight,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Confirm Password",
                                        style: TextStyle(
                                          fontSize: FontSize.s16,
                                          color: ColorManagement.colorWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15, top: 10),
                                        child: TextFormField(
                                          obscureText: true,
                                          validator: (passCurrentValue) {
                                            RegExp regex = RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                                            var passNonNullValue =
                                                passCurrentValue ?? "";
                                            if (passNonNullValue.isEmpty) {
                                              return "Password is required";
                                            } else if (passNonNullValue.length <
                                                6) {
                                              return "Password Must be more than 5 characters";
                                            } else if (!regex
                                                .hasMatch(passNonNullValue)) {
                                              return "Password should contain upper,lower,digit and Special character ";
                                            }
                                            return null;
                                          },
                                          controller:
                                              AppStrings.PasswordConCreate,
                                          style:
                                              TextStyle(fontSize: FontSize.s12),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: ColorManagement
                                                .colorPrimaryLight,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Checkbox(
                                      //       value: isChecked,
                                      //       activeColor: Color(0xffA9A454),
                                      //       onChanged: (newBool) {
                                      //         setState(() {
                                      //           isChecked = newBool;
                                      //         });
                                      //       },
                                      //     ),
                                      //     Text(
                                      //       "Remember me",
                                      //       style: TextStyle(
                                      //           fontFamily:
                                      //               'Montserrat-VariableFont_wght',
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.bold),
                                      //     )
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            setState(() {
                                              loading = true;
                                            });
                                            AppStrings
                                                .signUpFromKey.currentState
                                                ?.save();
                                            if (AppStrings
                                                .signUpFromKey.currentState!
                                                .validate()) {
                                              if (AppStrings
                                                      .PasswordCreate.text !=
                                                  AppStrings
                                                      .PasswordConCreate.text) {
                                                Get.snackbar(
                                                  'Failed',
                                                  'Password does not match',
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  backgroundColor:
                                                      Colors.red[900],
                                                );
                                                setState(() {
                                                  loading = false;
                                                });
                                              } else {
                                                try {
                                                  await controller
                                                      .referenceImageToUploud
                                                      .putFile(_file!);
                                                  // controller.referenceImageToUploud.delete();
                                                  UrlImage = await controller
                                                      .referenceImageToUploud
                                                      .getDownloadURL();
                                                  print(
                                                      '${UrlImage} Image Uplude ');
                                                } catch (e) {
                                                  print('error Image');
                                                  print(
                                                      'Image ${e.toString()}');
                                                }
                                                String? mass = await controller
                                                    .CreateAccount(
                                                  AppStrings.EmailCreate.text,
                                                  AppStrings
                                                      .PasswordCreate.text,
                                                  AppStrings.NameCreate.text,
                                                  '1',
                                                  UrlImage.toString(),
                                                );
                                                Get.snackbar('Massge', mass,
                                                    backgroundColor:
                                                        Colors.greenAccent);
                                                setState(() {
                                                  loading = false;
                                                });
                                                Get.offAndToNamed(PageTo.login);
                                              }
                                            } else {
                                              setState(() {
                                                loading = false;
                                              });
                                              Get.snackbar('Failed',
                                                  ' Variables are not entered check the information',
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  backgroundColor:
                                                      Colors.red[900],
                                                  colorText: ColorManagement
                                                      .colorWhite);
                                            }
                                          },
                                          height: 60,
                                          minWidth: 200,
                                          child: Text(
                                            'Create',
                                            style: TextStyle(
                                                fontSize: FontSize.s22),
                                          ),
                                          textColor:
                                              ColorManagement.colorPrimary,
                                          color:
                                              ColorManagement.colorPrimaryLight,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            )));
  }
}
