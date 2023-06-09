import 'package:flutter/widgets.dart';
import 'package:flutter_auth_bloc/presentation/pages/home_page.dart';
import 'package:flutter_auth_bloc/presentation/pages/login_page.dart';
import 'package:flutter_auth_bloc/presentation/pages/registration_page.dart';
import 'package:flutter_auth_bloc/presentation/pages/splash.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (_) => const LoginPage(),
  '/register': (_) => const RegisterPage(),
  '/home': (_) => const HomePage(),
  '/': (_) => const SplashPage(),
};
