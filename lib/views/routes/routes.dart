import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/views/form_input.dart';
import 'package:flutter_firebase/views/home.dart';
import 'package:flutter_firebase/views/layouts/main_layout.dart';
import 'package:get/get.dart';

class Routes {
  static String home = "/";
  static String form = "/form";
  String currentRoute = '';

  static String getHomeRoute() => home;

  static String getFormRoute() => form;

  static String getCurrentRoute() => Get.currentRoute;

  static bool isHomePage() {
    return getCurrentRoute() == home ? true : false;
  }

  static bool isCreatePage() {
    return getCurrentRoute() == form ? true : false;
  }

  static List<GetPage> routes = [
    GetPage(name: home, page: () => MainLayout(content: Home())),
    GetPage(name: form, page: () => MainLayout(content: FormInput())),
  ];
}