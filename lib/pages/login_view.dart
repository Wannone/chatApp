import 'package:chatapp/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.width * 0.7,
                  width: Get.width * 0.7,
                  child: Icon(
                    Icons.chat,
                    size: Get.width * 0.7,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    authController.login();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign in with Google',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
