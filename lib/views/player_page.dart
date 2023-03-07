import 'package:flutter/material.dart';
import 'package:spotify_ui/models/album.dart';
import 'package:spotify_ui/utils/duration_formatter.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  Duration currentPlayTime = const Duration(minutes: 0, seconds: 0);

  // スライダーの値
  double _sliderTime = 0.0;

  void _changeSlider(double e) => setState(() {
        _sliderTime = e;
        currentPlayTime = Duration(seconds: _sliderTime.toInt());
      });

  // 再生状態
  bool _isPlaying = false;

  // 再生状態の切り替え
  void _playPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 引数からalbumを取得
    final Album album = ModalRoute.of(context)?.settings.arguments as Album;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 36,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 36),
              child: SizedBox(
                height: 340,
                width: 340,
                child: Image.asset(album.imagePath),
              ),
            ),
            Text(
              album.title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              album.artist,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                activeTrackColor: Colors.white,
                activeTickMarkColor: Colors.white,
                inactiveTrackColor: Colors.grey[700],
                inactiveTickMarkColor: Colors.grey[700],
              ),
              child: Slider(
                value: _sliderTime,
                min: 0,
                max: album.playtime.inSeconds.toDouble(),
                divisions: album.playtime.inSeconds,
                onChanged: _changeSlider,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DurationFormat.toMinutesSeconds(currentPlayTime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    DurationFormat.toMinutesSeconds(album.playtime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 48,
                ),
                IconButton(
                  onPressed: _playPause,
                  icon: Icon(
                    _isPlaying ? Icons.play_circle : Icons.pause_circle,
                  ),
                  iconSize: 78,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                  iconSize: 48,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
