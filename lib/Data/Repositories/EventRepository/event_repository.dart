import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shellhacks2022/Data/Models/event.dart';
import 'package:shellhacks2022/Data/Models/user.dart' as UserModel;
import 'package:shellhacks2022/Data/Repositories/authentication_repository.dart';

class EventRepository {
  static Future<void> createEvent(
      String title, DateTime eventTime, int zipCode) async {
    var id = DateTime.now().toString();
    var cache = CacheClient();
    var user = cache.readUser();
    print(user.name);

    await FirebaseFirestore.instance
        .collection("Events")
        .add(Event.eventToMap(id, title, eventTime, zipCode, user));
  }

  static Future<List<Event>> fetchEvents() async {
    QuerySnapshot result =
        await FirebaseFirestore.instance.collection("Events").get();
    List<Event> eventsList = [];
    for (var event in result.docs) {
      eventsList.add(
        Event(
          id: event.get('id').toString(),
          title: event.get('title'),
          eventTime: DateTime.parse(event.get('id')),
          zipCode: 0,
          owner: UserModel.User.fromJson(jsonDecode(event.get('owner'))),
          participants: event
              .get('participants')
              .map((e) => UserModel.User.fromJson(jsonDecode(e)))
              .toList(),
        ),
      );
    }
    print(
      result.docs.first
          .get('participants')
          .map((e) => UserModel.User.fromJson(jsonDecode(e)))
          .toList() as List<dynamic>,
    );
    return eventsList;
  }
}
