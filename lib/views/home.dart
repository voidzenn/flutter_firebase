import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/controllers/user_controller.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'package:flutter_firebase/views/custom_widgets/cw_card.dart';
import 'package:flutter_firebase/views/routes/routes.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final UserController userController = UserController();
  Home({Key? key}) : super(key: key);

  handleCardClick(User user) {
    Get.toNamed(Routes.update, arguments: user);
  }

  Widget deleteButton(String? key) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
      child: ElevatedButton(
          onPressed: () {
            if (key != null) {
              userController.deleteUser(key);
            }
          },
          child: const Icon(Icons.delete)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: StreamBuilder(
              stream: userController.database.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.data?.snapshot.value != null) {
                  final UserDataList userList =
                      userController.getUserList(snapshot.data!.snapshot);
                  return ListView.builder(
                      itemCount: userList.dataList?.length,
                      itemBuilder: (context, index) {
                        final User user =
                            userList.dataList?.elementAt(index) as User;
                        final UserData userData =
                            UserData(name: user.userData?.name);
                        String? name = userData.name ?? "";
                        return CwCard(
                            content: Text(name),
                            button: deleteButton(user.key),
                            callback: () => handleCardClick(user));
                      });
                } else {
                  return Container();
                }
              }))
    ]);
  }
}
