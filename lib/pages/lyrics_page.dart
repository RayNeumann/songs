import 'package:flutter/material.dart';

import 'package:songs/view_models/song_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LyricsPage extends StatefulWidget {
  SongViewModel? song;

  LyricsPage({this.song});

  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  bool _isPageLoading = true;

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
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Stack(
                children: [
                  Expanded(
                    child: WebView(
                      initialUrl:
                          widget.song != null ? widget.song!.lyricsUrl : '',
                      onPageFinished: (finish) {
                        setState(() {
                          _isPageLoading = false;
                        });
                      },
                    ),
                  ),
                  _isPageLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
