import 'package:chatapp/pages/chat_room_view.dart';
import 'package:chatapp/pages/home_view.dart';
import 'package:chatapp/pages/introduction_view.dart';
import 'package:chatapp/pages/login_view.dart';
import 'package:chatapp/pages/profile_view.dart';
import 'package:chatapp/pages/search_view.dart';
import 'package:chatapp/pages/update_status_view.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(
      name: '/Home',
      page: () => const HomeView(),
    ),
    GetPage(
      name: '/Introduction',
      page: () => const IntroductionView(),
    ),
    GetPage(
      name: '/Login',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/Search',
      page: () => SearchView(),
    ),
    GetPage(
      name: '/Profile',
      page: () => ProfileView(),
    ),
    GetPage(
      name: '/UpdateStatus',
      page: () => const UpdateStatusView(),
    ),
    GetPage(
      name: '/ChatRoom',
      page: () => ChatRoomView(),
    )
  ];
}
