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

  @override
  List<Object?> get props =>
      [id, title, participants, eventTime, zipCode, owner];
}
