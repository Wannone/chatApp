import 'package:chatapp/controllers/auth_controller.dart';
import 'package:chatapp/controllers/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import './Routes/routes.dart';
import './utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final IntroController introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(() => GetMaterialApp(
                  title: 'Chat App',
                  initialRoute: introController.isSkipIntro.value
                      ? authController.isAuth.value
                          ? '/Home'
                          : '/Login'
                      : '/Introduction',
                  getPages: Routes.pages,
                ));
          }
          return FutureBuilder(
              future: introController.firstInitialized(),
              builder: (context, snapshot) {
                return FutureBuilder(
                    future: authController.firstInitialized(),
                    builder: (context, snapshot) => const SplashScreen());
              });
        });
  }
}
