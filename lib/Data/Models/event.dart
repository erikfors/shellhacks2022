import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:shellhacks2022/Data/Models/user.dart';

class Event extends Equatable {
  final String id;
  final String? title;
  List<dynamic>? participants;
  final DateTime? eventTime;
  final int? zipCode;
  final User? owner;
  final String? url;

  /// {@macro user}
  Event(
      {required this.id,
      this.title,
      this.participants,
      this.eventTime,
      this.zipCode,
      this.owner,
      this.url});

  static Map<String, dynamic> eventToMap(
      String id,
      String title,
      List<String> participants,
      DateTime eventTime,
      int zipCode,
      User? currentUser) {
    return {
      "id": id,
      "title": title,
      "participants": participants,
      "eventTime": eventTime,
      "zip": zipCode,
      "owner": json.encode(
        currentUser!.toJson(),
      ),
    };
  }

  static Event mapToEvent(Map<String, dynamic> map) {
    return Event(
      id: map["id"],
      eventTime: map["eventTime"],
      owner: User.fromJson(map["owner"]),
      participants: map["participants"],
      title: map["title"],
      zipCode: int.parse(map["zip"]),
      url: map["url"]
    );
  }

  @override
  List<Object?> get props =>
      [id, title, participants, eventTime, zipCode, owner, url];
}
