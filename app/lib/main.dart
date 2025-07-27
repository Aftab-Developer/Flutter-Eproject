import 'package:app/bloc/auth_bloc.dart';
import 'package:app/cubit/google_auth_cubit.dart';
import 'package:app/cubit/otp_verify_auth_cubit.dart';
import 'package:app/cubit/reset_pass_auth_cubit.dart';
import 'package:app/data_provider/Auth_data.dart';
import 'package:app/repository/Auth_repo.dart';
import 'package:app/screens/ChangePasswordScreen.dart';
import 'package:app/screens/SplachScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthRepo(authData: AuthData())),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                repo: context.read<AuthRepo>(),
              ),
            ),
            BlocProvider(
              create: (_) => OtpVerifyAuthCubit(),
            ),
            BlocProvider(
              create: (_) => ResetPassAuthCubit(),
            ), 
            BlocProvider(
              create: (_) => GoogleAuth(),
            ),
          ],
          child: const MyApp(),
        ),
      ),
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
      title: 'Flutter Auth App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
      ),
      home: SplachScreen(),
    );
  }
}
