import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/register.dart';

class RoundedDropDown extends GetView<RegisterController> {
  RoundedDropDown(
      {Key? key, required this.child, this.textColor = Colors.white})
      : super(key: key);

  Widget child;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // total height = margin 20 + hint 20

    return Container(
        //margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width,
        decoration: BoxDecoration(
          color: kSubItemColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: kSubItemColor, style: BorderStyle.solid, width: 0.80),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Theme(
                data: ThemeData(
                  canvasColor: kSubItemColor,
                  primaryColor: Colors.white,
                  // primaryColor: kPrimaryLightColor,
                ),
                child: // Your Dropdown Code Here,
                    DropdownButtonHideUnderline(
                  child: ButtonTheme(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      alignedDropdown: true,
                      child: child),
                ))));
  }
}
