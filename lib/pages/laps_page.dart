import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_f1/utils/timer_format.dart';

import '../providers/timer_provider.dart';

class LapsPage extends StatelessWidget {
  const LapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context, listen: false);
    final laps = timerProvider.getLaps();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Vueltas'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: laps.length,
          itemBuilder: (context, index) {
            var lap = laps[index];
            
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${index + 1}',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Expanded(
                    child: Text(
                      TimerFormat.formatMilliseconds(lap),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: GoogleFonts.dmMono().fontFamily,
                        backgroundColor: lap == timerProvider.fastestLap ? Colors.purple : null,
                        color: lap == timerProvider.fastestLap ? Colors.white : null,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
