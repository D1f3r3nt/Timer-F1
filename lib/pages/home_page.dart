import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
      // TODO: Change theme
    }
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '01:20.021',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: GoogleFonts.orbitron().fontFamily
                    ),
                  ),
                  IconButton(onPressed: handleChangeTheme, icon: const Icon(Icons.sunny))
                ],
              ),
              const Expanded(child: SizedBox()),
              Text(
                '01:20.021',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 120,
                  fontFamily: GoogleFonts.orbitron().fontFamily
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
