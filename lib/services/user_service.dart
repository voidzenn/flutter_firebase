import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase/models/response.dart';
import 'dart:core' as fix;

class UserService {
  final DatabaseReference database = FirebaseDatabase.instance.ref("users");
  final fix.String statusSuccess = "success";
  final fix.String statusFailed = "failed";

  fix.String? key;

  UserService({this.key});

  createUser(fix.String text) async
    fix.String
    fix.String? newKey = database.push().key;
    await database.child(newKey!).set({"name": text}).then((_) => {
      print("success")
    }).catchError((error) => {
      print(error.toString())
    });
  }

  deleteUser(String key) async{
    await database.child(key).remove();
  }
}