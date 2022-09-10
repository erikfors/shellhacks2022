import 'package:flutter/material.dart';

import '../../Data/Models/event.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});
  final List<Event> events = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        // list of events with details
        body: ListView());
  }
}
