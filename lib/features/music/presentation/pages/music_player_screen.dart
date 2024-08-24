import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mental_healh_app/configs/constants/appImages.dart';
import 'package:mental_healh_app/core/theme.dart';
import 'package:mental_healh_app/features/music/domain/entities/song.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Song song;

  const MusicPlayerScreen({super.key, required this.song});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.song.song_link);
    super.initState();
  }

  void tooglePlayPlause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seekBackWard() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _audioPlayer.seek(newPosition);
  }

  void toogleLoop() {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  void seekRestart() {
    _audioPlayer.seek(Duration.zero);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            child: Image.asset(
              Appimages.downArrow,
            ),
            onTap: () => Navigator.of(context).pop()),
        actions: [
          Image.asset(Appimages.transcriptIcon),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      backgroundColor: DefaultColors.white,
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Appimages.childWithDog,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.song.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              'by ${widget.song.author}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final total = _audioPlayer.duration ?? Duration.zero;
                  return ProgressBar(
                    progress: position,
                    total: total,
                    baseBarColor: DefaultColors.lightpink,
                    progressBarColor: DefaultColors.pink,
                    thumbColor: DefaultColors.pink,
                    onSeek: (duration) {
                      _audioPlayer.seek(duration);
                    },
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle, color: DefaultColors.pink),
                ),
                IconButton(
                  onPressed: () {
                    seekBackWard();
                  },
                  icon: const Icon(Icons.skip_previous,
                      color: DefaultColors.pink),
                ),
                StreamBuilder(
                    stream: _audioPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState =
                          playerState?.processingState ?? ProcessingState.idle;
                      final playing = playerState?.playing ?? false;

                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 50.0,
                          height: 50.0,
                          child: const CircularProgressIndicator(
                              color: DefaultColors.pink),
                        );
                      } else if (playing) {
                        return IconButton(
                          onPressed: tooglePlayPlause,
                          icon: const Icon(
                            Icons.pause_circle_filled,
                            color: DefaultColors.pink,
                            size: 50,
                          ),
                        );
                      } else if (processingState != ProcessingState.completed) {
                        return IconButton(
                          onPressed: tooglePlayPlause,
                          icon: const Icon(Icons.play_circle_fill,
                              color: DefaultColors.pink, size: 50),
                        );
                      } else {
                        return IconButton(
                          onPressed: seekRestart,
                          icon: const Icon(Icons.replay_circle_filled,
                              color: DefaultColors.pink),
                        );
                      }
                    }),
                IconButton(
                  onPressed: () {
                    seekForward();
                  },
                  icon: const Icon(Icons.skip_next, color: DefaultColors.pink),
                ),
                IconButton(
                  onPressed: () {
                    toogleLoop();
                  },
                  icon: Icon(isLooping ? Icons.repeat_one : Icons.repeat,
                      color: DefaultColors.pink),
                ),
              ],
            )
          ])),
    );
  }
}
