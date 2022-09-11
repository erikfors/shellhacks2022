part of 'events_bloc.dart';

enum EventStatus { initial, success, failure }

class EventState extends Equatable {
  const EventState({
    this.status = EventStatus.initial,
    this.events = const <Event>[],
  });

  final EventStatus status;
  final List<Event> events;

  EventState copyWith({
    EventStatus? status,
    List<Event>? events,
  }) {
    return EventState(
      status: status ?? this.status,
      events: events ?? this.events,
    );
  }

  @override
  String toString() {
    return '''EventState { status: $status, posts: ${events.length} }''';
  }

  @override
  List<Object> get props => [status, events];
}