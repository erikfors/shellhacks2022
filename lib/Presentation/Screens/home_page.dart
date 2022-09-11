import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shellhacks2022/Data/Blocs/bloc_event/events_bloc.dart';
import 'package:shellhacks2022/Presentation/Screens/event_page.dart';
import 'package:shellhacks2022/Presentation/Widgets/HomePage/events_list.dart';

import '../../Data/Blocs/bloc_app/app_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
        ),
        body: BlocProvider(
          create: (_) => EventsBloc()..add(EventsFetched()),
          child: const EventsList(),
        ));
  }
}
