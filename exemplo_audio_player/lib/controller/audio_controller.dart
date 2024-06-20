

import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_audio_player/models/audio_model.dart';

class AudioController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late int currentIndex;
  late List<AudioModel> audioList;

  AudioModel get currentAudio => audioList[currentIndex];

  AudioController({required this.audioList, required this.currentIndex}) {
    _audioPlayer.onDurationChanged.listen((Duration d) {
      duration = d;
    });
    _audioPlayer.onPositionChanged.listen((Duration p) {
      position = p;
    });
  }

  Stream<Duration> get onDurationChanged => _audioPlayer.onDurationChanged;
  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  void playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(currentAudio.url));
    }
    isPlaying = !isPlaying;
  }

  void stop() async {
    await _audioPlayer.stop();
    isPlaying = false;
    position = Duration.zero;
  }

  void replay() async {
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.play(UrlSource(currentAudio.url));
    isPlaying = true;
  }

  void next() {
    if (currentIndex < audioList.length - 1) {
      currentIndex++;
      playNewAudio();
    }
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
      playNewAudio();
    }
  }

  void playNewAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(currentAudio.url));
    isPlaying = true;
    position = Duration.zero;
  }

  Future<void> seek(double value) async {
    final position = Duration(seconds: value.toInt());
    await _audioPlayer.seek(position);
    this.position = position;
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (hours > 0) twoDigits(hours),
      minutes,
      seconds,
    ].join(':');
  }
}