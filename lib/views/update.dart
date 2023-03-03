import 'package:flutter/material.dart';
import 'package:flutter_firebase/controllers/user_controller.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'package:flutter_firebase/views/custom_widgets/cw_form.dart';
import 'package:get/get.dart';

class Update extends StatelessWidget {
  final UserController userController = UserController();

  Update({Key? key}) : super(key: key);

  handleUpdate(String key){
    userController.updateUser(key);
  }

  Widget updateBtn(String key){
    return ElevatedButton(
      onPressed: () {
        handleUpdate(key);
      },
      child: const Text("Update", style: TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User args = Get.arguments as User;
    final String key = args.key ?? "";
    userController.nameInputController.value.text = args.userData?.name ?? "";

    return Material(child: Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: CwForm(nameController: userController.nameInputController.value, actionWgt: updateBtn(key)),
    ));
  }
}
