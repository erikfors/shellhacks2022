import 'package:flutter/material.dart';

import '../../Data/Models/event.dart';
import '../../Data/Models/user.dart';
import '../Widgets/EventsPage/single_event.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
  static final List<Event> events = [
    Event(
      id: '1',
      title: 'Event 1',
      participants: const [
        User(
          id: '1',
          email: '',
          name: 'User 1',
        ),
        User(
          id: '2',
          email: '',
          name: 'User 2',
        ),
      ],
      eventTime: DateTime.now(),
      zipCode: 12345,
      owner: null,
      url: "https://images.unsplash.com/photo-1593068919175-24657e06ae91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" 
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Events'),
      ),
      // list of events with details
      // final String id;
      // final String? title;
      // List<User>? participants;
      // final DateTime? eventTime;
      // final int? zipCode;
      // final User? owner;
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return SingleEvent(
              eventTime: events[index].eventTime,
              owner: events[index].owner,
              participants: events[index].participants,
              title: events[index].title,
              zipCode: events[index].zipCode,
              url: events[index].url,
            );
          },
        ),
      ),
    );
  }
}
