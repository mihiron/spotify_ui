import 'package:flutter/material.dart';
import 'package:spotify_ui/models/album.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  // 再生状態
  bool _isPlaying = false;

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
        leading: const Icon(
          Icons.chevron_left,
          size: 36,
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
