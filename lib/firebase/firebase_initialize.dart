import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/firebase_options.dart';

class FirebaseInitialize {
  String? status = "";

  initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
