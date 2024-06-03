import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loadingscreen.dart';
import 'package:world_clock/pages/location.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const LoadingScreen(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation()
  },
));