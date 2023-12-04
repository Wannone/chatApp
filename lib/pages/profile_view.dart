import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                authController.logout();
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AvatarGlow(
                  endRadius: 110,
                  glowColor: Colors.black,
                  duration: const Duration(seconds: 2),
                  child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(100),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                onTap: () => Get.toNamed('/UpdateStatus'),
                leading: const Icon(Icons.note_add_outlined),
                title: const Text(
                  'Update Status',
                  style: TextStyle(fontSize: 22),
                ),
                trailing: const Icon(Icons.arrow_right, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
