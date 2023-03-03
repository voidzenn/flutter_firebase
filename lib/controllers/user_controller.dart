import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/controllers/request_controller.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'package:flutter_firebase/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final DatabaseReference database = UserService().database;
  final UserService _userService = UserService();
  final RequestController requestController = RequestController();
  final Rx<TextEditingController> nameInputController =
      TextEditingController().obs;

  UserDataList getUserList(DataSnapshot snapshot) {
    UserDataList userList = UserDataList.fromMap(snapshot.value as dynamic);
    return userList;
  }

  void createUser() {
    if (nameInputController.value.text.isNotEmpty) {
      _userService
          .createUser(nameInputController.value.text)
          .then((response) => {
                if (response.status == "success")
                  {
                    RequestController.responseMessage.value = response.message!,
                    RequestController.responseStatus.value = response.status!,
                  }
              });
    }
  }

  void updateUser(String key) {
    if (nameInputController.value.text.isNotEmpty) {
      UserData userData = UserData(name: nameInputController.value.text);
      User user = User(key: key, userData: userData);
      _userService.updateUser(user).then((response) => {
            if (response.status == "success")
              {
                RequestController.responseMessage.value = response.message!,
                RequestController.responseStatus.value = response.status!,
              }
          });
    }
  }

  void deleteUser(String key) async {
    _userService.deleteUser(key).then((response) => {
          if (response.status == "success")
            {
              RequestController.responseMessage.value = response.message!,
              RequestController.responseStatus.value = response.status!,
            }
        });
  }
}
