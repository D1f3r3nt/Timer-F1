import 'package:flutter/material.dart';
import 'package:timer_f1/pages/history_page.dart';
import 'package:timer_f1/pages/laps_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder> getRoutes = {
  '/' : (context) => HomePage(),
  'history' : (context) => HistoryPage(),
  'laps' : (context) => LapsPage(),
};