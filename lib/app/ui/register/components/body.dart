import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:enft/app/constant/constant.dart';

import 'package:enft/app/controller/register.dart';

import 'package:enft/app/ui/register/components/rounded_check_duplicate_button.dart';
import 'package:enft/app/ui/register/components/rounded_register_button.dart';
import 'package:enft/app/ui/register/components/rounded_drop_down.dart';

class RegisterBody extends GetView<RegisterController> {
  RegisterBody({Key? key}) : super(key: key);

  String name = "";
  String nickname = "";

  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(content), actions: actions));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightLottie = size.width - kDefaultPadding * 2;
    final heightInputField = 50;
    final heightDropDown = 40;
    final heightButton = 64;
    final paddingFromTop = (size.height -
            (heightLottie + heightInputField + heightDropDown + heightButton)) /
        4;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SingleChildScrollView(
                    // scroll disable
                    // physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: paddingFromTop),
                    Lottie.asset("assets/lottie/register.json"),
                    RoundedCheckDuplicateButton(
                        maxLength: 10,
                        hintText: "???????????? ???????????????",
                        onChanged: (value) => controller.user.nickname = value,
                        onSubmitted: (value) =>
                            controller.user.nickname = value,
                        onPressed: () async {
                          if (controller.user.nickname.length < 2) {
                            openDialog('?????? ?????? ?????????', '???????????? 2?????? ??????????????? ?????????.', [
                              TextButton(
                                child: const Text('??????'),
                                onPressed: () => Get.back(),
                              )
                            ]);
                            return;
                          }
                          await controller
                              .alreadyNickname(controller.user.nickname);
                          print(controller.isAlreadyNickname);
                          if (!controller.isAlreadyNickname) {
                            openDialog(
                              '????????? ?????? ??????',
                              '?????? ???????????? ??????????????????.',
                              [
                                TextButton(
                                  child: const Text('??????'),
                                  onPressed: () => Get.back(),
                                )
                              ],
                            );
                            return;
                          } else {
                            openDialog(
                              '????????? ?????? ??????',
                              '?????? ????????? ??????????????????.',
                              [
                                TextButton(
                                  child: const Text('??????'),
                                  onPressed: () => Get.back(),
                                )
                              ],
                            );
                            return;
                          }
                        }),
                    RoundedDropDown(values: ['??????', '??????']),
                    RoundedRegisterButton(
                      onPressed: () {
                        print(!controller.isAlreadyNickname);
                        if (!controller.isAlreadyNickname) {
                          openDialog('????????????', '????????? ??????????????? ????????????', [
                            TextButton(
                                onPressed: () => Get.back(), child: Text("??????"))
                          ]);
                          return;
                        } else
                          Get.toNamed('/register_profile');
                      },
                      text: '????????????',
                    ),
                  ],
                )))));
  }
}
