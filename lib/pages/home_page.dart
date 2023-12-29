import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_f1/utils/timer_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stopwatch time = Stopwatch();
  
  @override
  void initState() {
    super.initState();
    // TODO: First
  }
  
  @override
  void dispose() {
    super.dispose();
    // TODO: Last
  }
  
  @override
  Widget build(BuildContext context) {
    void handleChangeTheme() {
      if (time.isRunning) {
        time.stop();
        time.reset();
      } else {
        time.start();
      }
    }
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '01:20.021',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      fontFamily: GoogleFonts.dmMono().fontFamily,
                      backgroundColor: Colors.green
                    ),
                  ),
                  Text(
                    '01:20.021',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        fontFamily: GoogleFonts.dmMono().fontFamily,
                        backgroundColor: Colors.purple,
                        color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              TimerText(stopwatch: time),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
