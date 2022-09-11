import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shellhacks2022/Data/Blocs/bloc_event/events_bloc.dart';
import 'package:shellhacks2022/Presentation/Screens/event_page.dart';
import 'package:shellhacks2022/Presentation/Widgets/HomePage/events_list.dart';

import '../../Data/Blocs/bloc_app/app_bloc.dart';
import '../../Data/Repositories/authentication_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final currentUser = CacheClient().readUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      // body: Align(
      //   alignment: const Alignment(0, -1 / 3),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       //Avatar(photo: user.photo),
      //       const SizedBox(height: 4),
      //       Text(user.email ?? '', style: textTheme.headline6),
      //       const SizedBox(height: 4),
      //       Text(currentUser.phoneNumber ?? '', style: textTheme.headline5),
      //       const SizedBox(height: 4),
      //     ],
      //   ),
      // ),
      body: BlocProvider(
        create: (_) => EventsBloc()..add(EventsFetched()),
        child: const Padding(
          padding: EdgeInsets.all(25.0),
          child: EventsList(),
        ),
      ),
    );
  }
}
