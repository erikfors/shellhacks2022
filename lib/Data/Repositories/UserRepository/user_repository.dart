import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../Models/user.dart';

class UserRepository {
  static Future<User> getUser(String id) async {
    var docRef = FirebaseFirestore.instance.collection("User").doc(id);
    var snaptchot = await docRef.get();
    var user = User.fromJson(snaptchot.data());
    return user;
  }

  static Future<void> addUser(User user) async {
    await FirebaseFirestore.instance.collection("User").add(user.toJson());
  }
}
