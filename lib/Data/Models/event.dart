import 'package:equatable/equatable.dart';
import 'package:shellhacks2022/Data/Models/user.dart';

class Event extends Equatable {
  final String id;
  final String? title;
  List<User>? participants;
  final DateTime? eventTime;
  final int? zipCode;
  final User? owner;

  /// {@macro user}
  Event({
    required this.id,
    this.title,
    this.participants,
    this.eventTime,
    this.zipCode,
    this.owner,
  });

  static Map<String,dynamic> eventToMap(String id, String title, DateTime eventTime, int zipCode, User? currentUser){
    return {"id" : id, "title": title, "participants": [currentUser], "eventTime" : eventTime, "zip": zipCode, "owner": currentUser};
  }

  @override
  List<Object?> get props =>
      [id, title, participants, eventTime, zipCode, owner];
}
