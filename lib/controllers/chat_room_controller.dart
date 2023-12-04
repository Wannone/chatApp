import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  RxBool showEmojiPicker = false.obs;

  late FocusNode focusNode;
  late TextEditingController textEditingController;

  void addEmojiToChat(Emoji emoji) {
    textEditingController.text = textEditingController.text + emoji.emoji;
  }

  void deleteEmoji() {
    textEditingController.text = textEditingController.text
        .substring(0, textEditingController.text.length - 2);
  }

  @override
  void onInit() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showEmojiPicker.value = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
