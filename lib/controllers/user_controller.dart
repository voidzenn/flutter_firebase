import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'package:flutter_firebase/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserService userService = UserService();
  final Rx<TextEditingController> nameInputController = TextEditingController()
      .obs;

  UserDataList getUserList(DataSnapshot snapshot) {
    UserDataList userList = UserDataList.fromMap(snapshot.value as dynamic);
    return userList;
  }

  void createUser() {
    if(nameInputController.value.text.isNotEmpty){
      userService.createUser(nameInputController.value.text);
    }
  }

  void deleteUser(String key) async {
    userService.deleteUser(key);
  }
}
