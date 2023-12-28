import 'package:audio_service/audio_service.dart';

class AudioClickHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  
  @override
  Future<void> click([MediaButton button = MediaButton.media]) {
    return super.click(button);
  }
}