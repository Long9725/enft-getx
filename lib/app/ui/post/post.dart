import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post.dart';

import 'package:enft/app/ui/post/components/body.dart';

class PostPage extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<PostController>(tag: Get.arguments['tag'].toString());
    return Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(controller),
        body: PostBody());
  }

  BottomAppBar buildBottomNavigationBar(PostController controller) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: [
                const SizedBox(width: kDefaultPadding / 2),
                Expanded(
                    child: Text((controller.post.cost + " KLAY"),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24))),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "채팅으로 거래하기",
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
