import 'package:coffee_app/View/coffeemenu/list/list_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeMenu extends StatelessWidget {
  const CoffeeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff98694F),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Menu Stroke.svg"),
                ),
                IconButton(
                    color: const Color(0xff363636),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/Order - icon.svg"))
              ],
            ),
            const Text(
              "Menu",
              style: TextStyle(color: Color(0xffF5EDDA), fontSize: 35),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: detals.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        IconButton(
                            color: const Color(0xff363636),
                            onPressed: () {},
                            icon:
                                SvgPicture.asset("assets/icons/Add Fill.svg")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detals.elementAt(index).name,
                              style: TextStyle(
                                  color: Color(0xffF5EDDA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              detals.elementAt(index).detals,
                              style: TextStyle(
                                  color: Color(0xffF5EDDA), fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ]),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/image/CoffeeMenu.png",
            scale: 1,
          ),
        ),
      ]),
    ));
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