import 'package:flutter/material.dart';
import 'package:flutter_firebase/controllers/request_controller.dart';
import 'package:flutter_firebase/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase/views/routes/routes.dart';
import 'package:flutter_firebase/views/custom_widgets/cw_dialog.dart';


class MainLayout extends StatelessWidget {
  final Widget content;
  const MainLayout({Key? key, required this.content}) : super(key: key);

  Widget dialog() {
    String message = RequestController.responseMessage.value;
    return Visibility(visible: RequestController.responseMessage.value.isNotEmpty ,child: AlertDialog(
      content: Text(message, style: TextStyle(color: RequestController.responseStatus.value == "success" ? Colors.green : Colors.black )),
      actions: [
       Padding(padding: const EdgeInsets.fromLTRB(10, 5, 10, 5), child:ElevatedButton(
         onPressed: () {
           RequestController.responseMessage.value = "";
         },
         child: const Text('Close'),
       ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
            visible: !Routes.isHomePage(),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.toNamed(Routes.home);
              },
            )),
        leadingWidth: Routes.isHomePage() ? 0 : 40,
        title: const Text(
          "User List",
          style: TextStyle(fontFamily: 'RobotoMedium'),
        ),
      ),
      body: Stack(
        children: [
          content, Obx(() => dialog() )
        ],
      ),
      floatingActionButton: Opacity(
        opacity: Routes.isHomePage() ? 1 : 0,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.form);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}