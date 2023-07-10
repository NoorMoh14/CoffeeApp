import 'package:coffee_app/Shared/Resource/color_mangment.dart';
import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:coffee_app/Shared/Resource/view_mangment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegsterPage extends StatefulWidget {
  const RegsterPage({super.key});

  @override
  State<RegsterPage> createState() => _RegsterPageState();
}

class _RegsterPageState extends State<RegsterPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff363636),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(PaddingEdit.p20),
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
              padding: EdgeInsets.only(left: PaddingEdit.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.04),
                  Padding(
                    padding: EdgeInsets.only(bottom: PaddingEdit.p20),
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
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManagement.colorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(fontSize: FontSize.s12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF5EDDA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(
                        fontSize: FontSize.s12,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManagement.colorPrimaryLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(fontSize: FontSize.s12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManagement.colorPrimaryLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: TextField(
                      style: TextStyle(fontSize: FontSize.s12),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManagement.colorPrimaryLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
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
                            fontFamily: 'Montserrat-VariableFont_wght',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {},
                      height: 60,
                      minWidth: 200,
                      child: Text(
                        'Create',
                        style: TextStyle(fontSize: FontSize.s22),
                      ),
                      textColor: ColorManagement.colorPrimary,
                      color: ColorManagement.colorPrimaryLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
