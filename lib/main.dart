import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shellhacks2022/Data/Blocs/observer.dart';
import 'package:shellhacks2022/Data/Repositories/authentication_repository.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final authenticationRepository = AuthenticationRepository();
  await CacheClient.initialize();

  await authenticationRepository.user.first;

  final themeStr =
      await rootBundle.loadString('lib/assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(App(authenticationRepository: authenticationRepository, theme: theme));
}
