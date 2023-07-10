import 'package:coffee_app/Shared/Base/routing.dart';
import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManagement.colorPrimary,
        body: Container(
          width: Get.width,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 35,
                    color: Colors.white,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.07),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome Back! ',
                        style: TextStyle(
                          fontSize: FontSize.s30,
                          color: ColorManagement.colorWhite,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.only(left: PaddingEdit.p20),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManagement.colorWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingEdit.p20, right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(fontSize: FontSize.s12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManagement.colorPrimaryLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: PaddingEdit.p20),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManagement.colorWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: PaddingEdit.p20, right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(fontSize: FontSize.s12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManagement.colorPrimaryLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: PaddingEdit.p8),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: Color(0xffA9A454),
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-VariableFont_wght',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        Get.toNamed(PageTo.about);
                      },
                      height: 60,
                      minWidth: 200,
                      child: Text(
                        'OK!',
                        style: TextStyle(fontSize: 23),
                      ),
                      textColor: ColorManagement.colorPrimary,
                      color: ColorManagement.colorPrimaryLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
