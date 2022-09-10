import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shellhacks2022/Data/Models/event.dart';

class EventRepository{

  static void createEvent(String title, DateTime eventTime, int zipCode){
    var id = DateTime.now().toString();
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("event").add(Event.eventToMap(id, title, eventTime, zipCode, currentUser));
  }

}