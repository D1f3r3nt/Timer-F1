import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      setState(() {

      });
    }
  }

  String formatMilliseconds(int milliseconds) {
    // Calculate minutes, seconds, and remaining milliseconds
    int minutes = (milliseconds / (60 * 1000)).floor();
    int seconds = ((milliseconds % (60 * 1000)) / 1000).floor();
    int remainingMilliseconds = milliseconds % 1000;

    // Format minutes, seconds, and milliseconds as two-digit strings
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    String formattedMilliseconds = remainingMilliseconds.toString().padLeft(3, '0');

    // Concatenate the formatted components into the final string
    String result = '$formattedMinutes:$formattedSeconds.$formattedMilliseconds';

    return result;
  }

  @override
  Widget build(BuildContext context) {
    
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        formatMilliseconds(stopwatch.elapsedMilliseconds),
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