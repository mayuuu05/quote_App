import 'package:flutter/material.dart';
import 'package:quotes_app/Screens/editingPage.dart';
import 'package:quotes_app/Screens/home_page.dart';
import 'package:quotes_app/Screens/introPage.dart';
import 'package:quotes_app/Screens/login.dart';
import 'package:quotes_app/Screens/quotes_view.dart';
import 'package:quotes_app/Screens/splashScreen.dart';
import 'package:quotes_app/Screens/themes.dart';

class AppRoutes{

  static Map <String,Widget Function(BuildContext)> routes= {
    '/': (context) => const Splashscreen(),
     '/intro': (context) => const IntroPage(),
     '/login': (context) => const LoginPage(),
     '/home': (context) => const HomePage(),
     '/view': (context) => const QuotesView(),
     '/theme': (context) => const Themes(),
     '/edit': (context) => const EditingPage(),

  };
}