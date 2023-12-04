import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
