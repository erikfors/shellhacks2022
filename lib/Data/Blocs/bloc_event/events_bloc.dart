import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shellhacks2022/Data/Models/event.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventState> {
   
   
    EventsBloc() : super(const EventState()) {
    on<EventsPost>(_onEventsPost);
  }

  // Future<void> _onEventsFetched(EventsFetched event, Emitter<EventState> emit) async {

  //   try {
  //     if (state.status == PostStatus.initial) {
  //       final posts = await _fetchPosts();
  //       return emit(state.copyWith(
  //         status: PostStatus.success,
  //         posts: posts,
  //         hasReachedMax: false,
  //       ));
  //     }
  //     final posts = await _fetchPosts(state.posts.length);
  //     emit(posts.isEmpty
  //         ? state.copyWith(hasReachedMax: true)
  //         : state.copyWith(
  //             status: PostStatus.success,
  //             posts: List.of(state.posts)..addAll(posts),
  //             hasReachedMax: false,
  //           ));
  //   } catch (_) {
  //     emit(state.copyWith(status: PostStatus.failure));
  //   }
  // }

  FutureOr<void> _onEventsPost(EventsPost event, Emitter<EventState> emit) {
  }

}
