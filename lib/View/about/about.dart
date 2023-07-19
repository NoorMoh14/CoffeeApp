import 'package:coffee_app/Shared/Resource/size_mangment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff363636),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 20),
                color: Colors.white,
                iconSize: 48,
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset("assets/icons/Menu Stroke.svg"),
              ),
              const Center(
                child: Text(
                  "About",
                  style: TextStyle(color: Color(0xffF5EDDA), fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla praesent feugiat porttitor velit urna ultrices. Leo pulvinar commodo scelerisque at feugiat lacus. Pretium egestas est interdum senectus.",
                      style: TextStyle(
                          color: Color(0xffF5EDDA),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Scelerisque metus non egestas enim laoreet. Pulvinar id faucibus libero erat. Massa vulputate volutpat in mi. Placerat est at morbi massa rhoncus at est leo. Molestie tellus bibendum orci nullam aenean. Elit, est, condimentum at congue at tellus. Diam sit pretium cras egestas scelerisque scelerisque aliquam enim. Nulla volutpat nunc enim netus adipiscing.Facilisis nunc non maecenas massa. Phasellus tortor, tortor pretium orci lectus turpis turpis. Quam eu, etiam nisl a diam feugiat. Vitae quis arcu dolor, sit dui tristique. ",
                      style: TextStyle(color: Color(0xffF5EDDA), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/image/Image_About.png",
            scale: 1,
          ),
        ),
      ]),
    ));
  }
}
