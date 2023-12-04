import 'package:chatapp/controllers/intro_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  RxBool isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  UserCredential? userCredential;
  IntroController introController = Get.put(IntroController());

  Future firstInitialized() async {
    await autoLogin().then((value) {
      value ? isAuth.value = true : isAuth.value = false;
    });
  }

  Future<bool> autoLogin() async {
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      return isSignIn ? true : false;
    } catch (error) {
      return false;
    }
  }

  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _user = value);
      await signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> signIn() async {
    final isSiginIn = await _googleSignIn.isSignedIn();

    if (isSiginIn) {
      await _addToFirebase();
      introController.readSkipIntro();
      isAuth.value = true;
      Get.toNamed('/Home');
    } else {
      isAuth.value = false;
    }
  }

  Future<void> _addToFirebase() async {
    final GoogleSignInAuthentication googleAuth = await _user!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => userCredential = value);
  }

  void logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut().then((value) => {
          isAuth.value = false,
          Get.offAllNamed('/Login'),
        });
  }
}
