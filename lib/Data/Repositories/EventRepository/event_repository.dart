import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shellhacks2022/Data/Models/event.dart';
import 'package:shellhacks2022/Data/Models/user.dart';
import 'package:shellhacks2022/Data/Repositories/authentication_repository.dart';

class EventRepository {
  static Future<void> createEvent(String title, DateTime eventTime,
      List<String> participants, int zipCode) async {
    var id = DateTime.now().toString();
    var cache = CacheClient();
    var user = cache.readUser();
    print(user.name);

    await FirebaseFirestore.instance.collection("Events").add(
        Event.eventToMap(id, title, participants, eventTime, zipCode, user));
  }

  static Future<List<Event>> fetchEvents() async {
    var result = await FirebaseFirestore.instance.collection("Events").get();
    List<Event> eventsList = [];
    for (var event in result.docs) {
      eventsList.add(
        Event.mapToEvent(
          event.data(),
        ),
      );
    }
    return eventsList;
  }
}
