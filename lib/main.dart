import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/register/register_bloc.dart';
import 'package:flutter_auth_bloc/data/datasources/auth_datasources.dart';
import 'package:flutter_auth_bloc/presentation/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(AuthDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Bloc',
        routes: appRoutes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            // Tambahkan penyesuaian gaya teks kustom di sini
            headlineLarge: GoogleFonts.poppins(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            // tambahkan penyesuaian teks lainnya sesuai kebutuhan Anda
          ),
        ),
        initialRoute: '/',
      ),
    );
  }
}
