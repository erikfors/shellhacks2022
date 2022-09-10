part of 'post_bloc.dart';

abstract class EventsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EventsFetched extends EventsEvent {}

class EventsPost extends EventsEvent {}

class EventsRefreshed extends EventsEvent {}