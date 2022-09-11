import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shellhacks2022/Data/Models/event.dart';
import 'package:shellhacks2022/Data/Repositories/EventRepository/event_repository.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventState> {
   
   
    EventsBloc() : super(const EventState()) {
    on<EventsFetched>(_onEventsFetched);
  }

  Future<void> _onEventsFetched(EventsFetched event, Emitter<EventState> emit) async {

    try {
      if (state.status == EventStatus.initial) {
       
        final events = await EventRepository.fetchEvents();
        
        emit(state.copyWith(
          status: EventStatus.success,
          events: events,
        ));
      }
     
    } catch (e) {
      print(e);
      emit(state.copyWith(status: EventStatus.failure));
    }
  }


}
