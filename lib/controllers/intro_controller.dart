import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroController extends GetxController {
  var isSkipIntro = false.obs;

  Future firstInitialized() async {
    await skipIntro().then((value) {
      value ? isSkipIntro.value = true : isSkipIntro.value = false;
    });
  }

  Future<bool> skipIntro() async {
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') != true) {
      return true;
    } else {
      return false;
    }
  }

  void readSkipIntro() {
    final box = GetStorage();
    if (box.read('skipIntro') != null) {
      box.remove('skipIntro');
    }
    box.write('skipIntro', true);
  }
}
