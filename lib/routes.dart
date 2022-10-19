
import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter/home/home_screen.dart';
import 'package:my_first_flutter/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen()
};