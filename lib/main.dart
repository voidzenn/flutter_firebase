import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/routes/routes.dart';
import 'package:flutter_firebase/firebase/firebase_initialize.dart';
import 'package:get/get.dart';

void main() async {
  FirebaseInitialize firebase = FirebaseInitialize();
  await firebase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}