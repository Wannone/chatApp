import 'package:chatapp/controllers/chat_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';

class ChatRoomView extends StatelessWidget {
  ChatRoomView({super.key});

  final ChatRoomController chatRoomController = Get.put(ChatRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black26,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
        title: const Column(
          children: [
            Text('Chat'),
            Text(
              'Status',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: ListView(
              children: [Container()],
            ),
          )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: chatRoomController.textEditingController,
                      focusNode: chatRoomController.focusNode,
                      decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          )),
                          prefixIcon: IconButton(
                              onPressed: () {
                                chatRoomController.focusNode.unfocus();
                                chatRoomController.showEmojiPicker.value =
                                    !chatRoomController.showEmojiPicker.value;
                              },
                              icon: const Icon(Icons.emoji_emotions_outlined))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
          Obx(() => (chatRoomController.showEmojiPicker.isTrue)
              ? Emoji(chatRoomController: chatRoomController)
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({
    super.key,
    required this.chatRoomController,
  });

  final ChatRoomController chatRoomController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          chatRoomController.addEmojiToChat(emoji);
        },
        onBackspacePressed: () {
          chatRoomController.deleteEmoji();
        },
        config: Config(
          columns: 7,
          emojiSizeMax: 32 *
              (foundation.defaultTargetPlatform == TargetPlatform.iOS
                  ? 1.30
                  : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          recentTabBehavior: RecentTabBehavior.RECENT,
          recentsLimit: 28,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ), // Needs to be const Widget
          loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL,
        ),
      ),
    );
  }
}
