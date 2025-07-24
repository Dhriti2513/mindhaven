class FlutterSoundRecorder {
  Future<void> openAudioSession() async {}
  Future<void> startRecorder({String? toFile}) async {}
  Future<void> stopRecorder() async {}
  bool get isRecording => false;
  void closeAudioSession() {}
}

class FlutterSoundPlayer {
  Future<void> openAudioSession() async {}
  Future<void> startPlayer({String? fromURI}) async {}
  Future<void> stopPlayer() async {}
  bool get isPlaying => false;
  void closeAudioSession() {}
}
