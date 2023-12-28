import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_f1/routes/routes.dart';
import 'package:timer_f1/utils/audio_click_handler.dart';

void main() async {
  runApp(const MyApp());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer F1',
      routes: getRoutes,
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
