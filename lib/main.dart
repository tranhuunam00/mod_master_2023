import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_master_2023/app.dart';
import 'package:mod_master_2023/blocs/authentication/authentication_bloc.dart';
import 'package:mod_master_2023/blocs/authentication/authentication_event.dart';
import 'package:mod_master_2023/provider/Chatbot.provider.dart';
import 'package:mod_master_2023/provider/bluetooth.provider.dart';
import 'package:mod_master_2023/repositories/authentication_repository.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  HttpOverrides.global = MyHttpOverrides();

  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository)
                  ..add(AppLoadedEvent())),
          ],
          child: MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) {
              return BluetoothProvider();
            }),
            ChangeNotifierProvider(create: (context) {
              return ChatbotProvider();
            }),
          ], child: const DoAnApp())),
    );
  }, (error, stackTrace) {});
}
