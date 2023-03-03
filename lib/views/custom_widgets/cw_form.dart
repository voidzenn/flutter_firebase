import 'package:flutter/material.dart';

class CwForm extends StatelessWidget {
  final TextEditingController nameController;
  final Widget actionWgt;

  const CwForm(
      {Key? key, required this.nameController, required this.actionWgt})
      : super(key: key);

  Widget nameInput() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(hintText: "Enter Name"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        nameInput(),
        actionWgt,
      ],
    );
  }
}
