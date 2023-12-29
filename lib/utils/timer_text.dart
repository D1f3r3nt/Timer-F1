import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_f1/utils/timer_format.dart';

class TimerText extends StatefulWidget {
  const TimerText({required this.stopwatch});
  final Stopwatch stopwatch;

  @override
  TimerTextState createState() => TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {

  late Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({required this.stopwatch}) {
    timer = Timer.periodic(const Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        TimerFormat.formatMilliseconds(stopwatch.elapsedMilliseconds),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 50,
            letterSpacing: 2.0,
            fontFamily: GoogleFonts.dmMono().fontFamily,
        ),
      ),
    );
  }
}