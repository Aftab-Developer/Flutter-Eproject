import 'package:app/bloc/auth_bloc.dart';
import 'package:app/data_provider/Auth_data.dart';
import 'package:app/repository/Auth_repo.dart';
import 'package:app/screens/SplachScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (_) => AuthRepo(authData: AuthData())),
          ],
          child: BlocProvider(
            create: (context) => AuthBloc(repo: context.read<AuthRepo>()),
            child: const MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
      ),
      title: 'Splash Screen',
      home: const SplachScreen(),
    );
  }
}
