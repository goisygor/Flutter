import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_audio_player/controller/audio_controller.dart';
import 'package:exemplo_audio_player/models/audio_model.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  final List<AudioModel> audioList;
  final int initialIndex;
  const AudioPlayerScreen({super.key, required this.audioList, required this.initialIndex});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioController _audioController;

  @override
  void initState() {
    super.initState();
    _audioController = AudioController(audioList: widget.audioList, currentIndex: widget.initialIndex);
    _audioController.onDurationChanged.listen((Duration d) {
      setState(() {
        _audioController.duration = d;
      });
    });
    _audioController.onPositionChanged.listen((Duration p) {
      setState(() {
        _audioController.position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentAudio = widget.audioList[_audioController.currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentAudio.title),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Alterar a cor de fundo da tela
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Adicionar imagem URL antes do ícone
                Image.network(
                  currentAudio.imageurl,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Slider(
                  min: 0,
                  max: _audioController.duration.inSeconds.toDouble(),
                  value: _audioController.position.inSeconds.toDouble(),
                  onChanged: (double value) async {
                    await _audioController.seek(Duration(seconds: value.toInt()) as double);
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_audioController.formatDuration(_audioController.position)),
                      Text(_audioController.formatDuration(_audioController.duration)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: Icon(
                    _audioController.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconSize: 64.0,
                  onPressed: () {
                    setState(() {
                      _audioController.playPause();
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  _audioController.isPlaying ? 'Playing' : 'Paused',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 48.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          _audioController.previous();
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      iconSize: 48.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          _audioController.next();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}