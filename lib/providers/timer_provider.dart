import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier {
  
  final List<int> _times = [];
  
  int fastestLap = 0;
  int lastLap = 0;
  bool isLastLapFaster = true;
  
  void saveTime(int time) {
    _times.add(time);
    
    if (lastLap == 0) {
      isLastLapFaster = true;
    } else {
      isLastLapFaster = time < lastLap;
    }
    
    if (fastestLap == 0) {
      fastestLap = time;
    } else {
      fastestLap = time < fastestLap ? time : fastestLap;
    }
    
    lastLap = time;
    
    notifyListeners();
  }
  
  void clearTimes() {
    _times.clear();
  }
}