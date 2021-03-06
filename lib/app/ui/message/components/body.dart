import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/message.dart';
import 'package:enft/app/ui/message/components/chat_input_field.dart';
import 'package:enft/app/ui/message/components/message.dart';

class MessageBody extends GetView {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MessageController>(tag: Get.arguments['tag']);
    return Column(
      children: [
        Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(() => ListView.builder(
                      reverse: true,
                      dragStartBehavior: DragStartBehavior.down,
                      itemCount: controller.messageList.length,
                      itemBuilder: (context, index) =>
                          ChatMessage(message: controller.messageList.reversed.toList()[index]),
                    )))),
        ChatInputField()
      ],
    );
  }
}
