import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shellhacks2022/Presentation/Screens/home_page.dart';
import 'package:shellhacks2022/Presentation/Screens/login_page.dart';
import 'package:shellhacks2022/Presentation/Screens/navigation_page.dart';
import 'package:shellhacks2022/Presentation/Screens/sign_up_page.dart';


import 'Data/Blocs/bloc_app/app_bloc.dart';
import 'Data/Repositories/authentication_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child:  AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Color(0XFF6730EC)),

        home: FlowBuilder<AppStatus>(
      state: context.select((AppBloc bloc) => bloc.state.status),
      onGeneratePages: (state, pages) {
        switch (state) {
          case AppStatus.unauthenticated:
            return [
              const MaterialPage(child: LoginPage()),
            ];
          case AppStatus.authenticated:
            return [
              const MaterialPage(child: NavigationScreen()),
            ];
        }
      },
    ));
  }
}
