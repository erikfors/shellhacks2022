import 'package:flutter/material.dart';

import '../../Data/Models/user.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
  final List<User> selectedParticipants = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      // form with text fields for event name, description, participants, zipcode and date
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: FormField(builder: (context) {
          return Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Event Name',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Event Description',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Zip code',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Event Date',
                ),
              ),
              // list where you can select multiple participants
              Expanded(
                child: SelectableList(
                  selectedChildren: selectedParticipants,
                  children: const [
                    User(id: '1', name: 'John', email: 'jhon@test.com'),
                    User(id: '2', name: 'Jane', email: 'jane@test.com'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(selectedParticipants);
                },
                child: Text('Create Event'),
              )
            ],
          );
        }),
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
    return ListView(
      children: widget.children.map((e) {
        return SelectableItem(
          selected: widget.selectedChildren.contains(e),
          onTap: () {
            setState(() {
              if (widget.selectedChildren.contains(e)) {
                widget.selectedChildren.remove(e);
              } else {
                widget.selectedChildren.add(e);
              }
            });
          },
          child: ListTile(
            title: Text(e.name!),
            subtitle: Text(e.email!),
          ),
        );
      }).toList(),
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
        color: widget.selected ? Colors.blue : Colors.white,
        child: widget.child,
      ),
    );
  }
}
