import 'package:flutter/material.dart';

import 'package:songs/view_models/song_view_model.dart';

class LyricsPage extends StatefulWidget {
  SongViewModel? song;

  LyricsPage({this.song});

  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Lyrics Page',
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.song!.fullTitle!,
                style: const TextStyle(fontSize: 25.0),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              child: Text('lyrics here'),
            ),
          ],
        ),
      ),
    );
  }
}
