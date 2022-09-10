import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shellhacks2022/Data/Models/event.dart';
import 'package:shellhacks2022/Data/Models/user.dart' as local;

class EventRepository{

  static void createEvent(String title, DateTime eventTime, int zipCode){
    var id = DateTime.now().toString();
    local.User? currentUser = FirebaseAuth.instance.currentUser as local.User?;

    FirebaseFirestore.instance.collection("event").add(Event.eventToMap(id, title, eventTime, zipCode, currentUser));
  }

}