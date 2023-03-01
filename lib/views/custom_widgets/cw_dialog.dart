import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CwDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const CwDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = this.title;
    var content = this.content;

    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        ElevatedButton(
          onPressed: () {
            // notesController.closeDialog();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}