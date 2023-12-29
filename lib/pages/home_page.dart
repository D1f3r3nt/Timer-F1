import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_f1/providers/timer_provider.dart';
import 'package:timer_f1/utils/timer_text.dart';

import '../utils/timer_format.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stopwatch time = Stopwatch();
  bool firstLap = true;
  int timeCapture = 0;
  bool delay = false;
  
  @override
  void dispose() {
    super.dispose();
    time.stop();
  }
  
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    
    void handleGo() async {
      if (delay) return;
      
      if (firstLap) {
        time.start();
        firstLap = false;
      } else {
        time.stop();
        timeCapture = time.elapsedMilliseconds;
        
        setState(() {
          delay = true;
          time.reset();
          time.start();
        });
        
        timerProvider.saveTime(timeCapture);
        
        Future.delayed(const Duration(seconds: 3), () => {
          setState(() {
            delay = false;
          })
        });
      } 
    }
    
    void handleNavigate() {
        
    }
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TimerFormat.formatMilliseconds(timerProvider.lastLap),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: GoogleFonts.dmMono().fontFamily,
                          backgroundColor: timerProvider.isLastLapFaster ? Colors.green : Colors.red 
                        ),
                      ),
                      Text(
                        TimerFormat.formatMilliseconds(timerProvider.fastestLap),
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
                  !delay
                    ? TimerText(stopwatch: time)
                    : FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          TimerFormat.formatMilliseconds(timeCapture),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                            letterSpacing: 2.0,
                            fontFamily: GoogleFonts.dmMono().fontFamily
                          ),
                        ),
                      ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              Expanded(
                child: GestureDetector(
                  onTap: handleGo,
                  onLongPress: handleNavigate,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
