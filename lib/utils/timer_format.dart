class TimerFormat {
  static String formatMilliseconds(int milliseconds) {
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
}