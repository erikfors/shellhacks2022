import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shellhacks2022/Presentation/Widgets/EventsPage/single_event.dart';

import '../../../Data/Blocs/bloc_event/events_bloc.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventState>(
      builder: (context, state) {
        switch (state.status) {
          case EventStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case EventStatus.success:
            if (state.events.isEmpty) {
              return const Center(child: Text('no events'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemBuilder: (BuildContext context, int index) {
                return SingleEvent(
                  eventTime: state.events[index].eventTime,
                  owner: state.events[index].owner,
                  participants: state.events[index].participants,
                  title: state.events[index].title,
                  zipCode: state.events[index].zipCode,
                );
              },
              itemCount: state.events.length,
            );
          case EventStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
