import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/generate_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Chat',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          )),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () => Get.toNamed('/Profile'),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.person,
                                  color: Colors.white, size: 35),
                            )),
                      ),
                    ])),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    reverse: true,
                    itemCount: myChats.length,
                    itemBuilder: (context, index) => myChats[index]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed('/Search'),
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.message_rounded,
            size: 30,
            color: Colors.white,
          ),
        ));
  }
}
