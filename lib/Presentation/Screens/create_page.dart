import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shellhacks2022/Data/Models/event.dart';
import 'package:shellhacks2022/Data/Repositories/EventRepository/event_repository.dart';

import '../../Data/Models/user.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
  final List<User> selectedParticipants = [];

  final nameControler = TextEditingController();
  final descriptionControler = TextEditingController();
  final locationControler = TextEditingController();

  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      // form with text fields for event name, description, participants, zipcode and date
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameControler,
                decoration: const InputDecoration(
                  hintText: 'Event Name',
                ),
              ),
              TextFormField(
                controller: descriptionControler,
                decoration: const InputDecoration(
                  hintText: 'Event Description',
                ),
              ),
              TextFormField(
                controller: locationControler,
                decoration: const InputDecoration(
                  hintText: 'Zip code',
                ),
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: (val) => print(val),
                onSaved: (val) {
                  selectedDate = DateTime.parse(val!);
                  print(selectedDate);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Participants'),
                ),
              ),
              const Divider(
                color: Colors.white70,
              ),
              // list where you can select multiple participants

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: SelectableList(
                    selectedChildren: selectedParticipants,
                    children: const [
                      User(id: '1', name: 'John', email: 'jhon@test.com'),
                      User(id: '2', name: 'Jane', email: 'jane@test.com'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    EventRepository.createEvent(
                      nameControler.text,
                      selectedDate,
                      selectedParticipants
                          .map((e) => json.encode(e.toJson()))
                          .toList(),
                      12354,
                    );
                  },
                  child: Text('Create Event'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableList extends StatefulWidget {
  const SelectableList({
    Key? key,
    required this.children,
    this.selectedChildren = const [],
  }) : super(key: key);

  final List<User> children;
  final List<User> selectedChildren;

  @override
  State<SelectableList> createState() => _SelectableListState();
}

class _SelectableListState extends State<SelectableList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return SelectableItem(
          selected: widget.selectedChildren.contains(widget.children[index]),
          onTap: () {
            setState(
              () {
                if (widget.selectedChildren.contains(widget.children[index])) {
                  widget.selectedChildren.remove(widget.children[index]);
                } else {
                  widget.selectedChildren.add(widget.children[index]);
                }
              },
            );
          },
          child: ListTile(
            title: Text(widget.children[index].name!),
            subtitle: Text(widget.children[index].email!),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.white70,
        );
      },
    );
  }
}

class SelectableItem extends StatefulWidget {
  const SelectableItem(
      {super.key,
      required this.child,
      required this.selected,
      required this.onTap});

  final Widget child;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<SelectableItem> createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: widget.selected
            ? Theme.of(context).highlightColor
            : Colors.transparent,
        child: widget.child,
      ),
    );
  }
}
