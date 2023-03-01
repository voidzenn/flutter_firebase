import 'package:flutter/material.dart';
import 'package:flutter_firebase/controllers/user_controller.dart';
import 'package:flutter_firebase/views/custom_widgets/cw_form.dart';

class FormInput extends StatelessWidget {
  final UserController userController = UserController();

  FormInput({Key? key}) : super(key: key);

  handleSave(){
    // print('handle save');
    userController.createUser();
  }

  Widget saveBtnWgt(){
    return ElevatedButton(
      onPressed: () {
        handleSave();
      },
      child: const Text("Save", style: TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    userController.nameInputController.value.text = "";

    return Material(child: Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: CwForm(nameController: userController.nameInputController.value, actionWgt: saveBtnWgt()),
    ));
  }
}
