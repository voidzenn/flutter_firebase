import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/views/form_input.dart';
import 'package:flutter_firebase/views/home.dart';
import 'package:flutter_firebase/views/layouts/main_layout.dart';
import 'package:flutter_firebase/views/update.dart';
import 'package:get/get.dart';

class Routes {
  static String home = "/";
  static String form = "/form";
  static String update = "/update";
  String currentRoute = '';

  static String getHomeRoute() => home;

  static String getFormRoute() => form;

  static String getUpdateRoute() => update;

  static String getCurrentRoute() => Get.currentRoute;

  static bool isHomePage() {
    return getCurrentRoute() == home ? true : false;
  }

  static bool isCreatePage() {
    return getCurrentRoute() == form ? true : false;
  }

  static bool isUpdatePage() {
    return getCurrentRoute() == update ? true : false;
  }

  static List<GetPage> routes = [
    GetPage(name: home, page: () => MainLayout(content: Home())),
    GetPage(name: form, page: () => MainLayout(content: FormInput())),
    GetPage(name: update, page: () => MainLayout(content: Update())),
  ];
}
