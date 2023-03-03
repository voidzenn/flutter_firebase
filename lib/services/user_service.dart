import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase/models/response.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'dart:developer' as developer;

class UserService {
  final DatabaseReference database = FirebaseDatabase.instance.ref("users");
  final String _statusSuccess = "success";
  final String _statusFailed = "failed";
  final Response _response = Response();

  String? key;

  UserService({this.key});

  Future<Response> createUser(String text) async {
    String? newKey = database.push().key;
    await database
        .child(newKey!)
        .set({"name": text})
        .then((_) => {
              _response.status = _statusSuccess,
              _response.message = "Successfully Saved"
            })
        .catchError((error) => {
              _response.status = _statusFailed,
              _response.message = "Error saving. Try again",
              throw Exception(error)
            });
    return _response;
  }

  Future<Response> updateUser(User user) async {
    if (user.userData?.name != null) {
      String name = user.userData?.name ?? "";
      Map<String, String> userData = {'name': name};
      await database
          .child(user.key!)
          .update(userData)
          .then((_) => {
                _response.status = _statusSuccess,
                _response.message = "Successfully Updated"
              })
          .catchError((error) => {
                _response.status = _statusFailed,
                _response.message = "Error updating. Try again",
                throw Exception(error)
              });
    }
    return _response;
  }

  Future<Response> deleteUser(String key) async {
    await database
        .child(key)
        .remove()
        .then((_) => {
              _response.status = _statusSuccess,
              _response.message = "Successfully Deleted"
            })
        .catchError((error) => {
              _response.status = _statusFailed,
              _response.message = "Error deleting. Try again",
              throw Exception(error)
            });
    return _response;
  }
}
