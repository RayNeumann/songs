// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:songs/models/song.dart';
import 'package:songs/pages/lyrics_page.dart';
import 'package:songs/services/web_service.dart';
import 'package:songs/view_models/song_view_model.dart';

class SongListViewModel extends ChangeNotifier {
  final WebService webService;
  String errorMessage = '';
  static const _maxNumberOfMerchants = 100;
  bool _showDetailPage = false;

  SongListViewModel(this.webService);

  Future<List<Song>> fetchSongs() async {
    List<Song> merchantsList = [];
    try {
      List<Song> SongsList = await webService.fetchSongs();
      if (SongsList.isEmpty) {
        errorMessage = 'empty merchant list';
      }
      return SongsList;
    } catch (e) {
      errorMessage = 'Error performing your request';
      return merchantsList;
    }
  }

  SongViewModel createSongViewModel(Song song) {
    return SongViewModel(song: song);
  }

  void onTap(BuildContext context, Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LyricsPage(
              song: createSongViewModel(
                  song!),
            ),
      ),
    );
  }

  int? get maxNumberOfMerchants => _maxNumberOfMerchants;

  bool get showDetailPage => _showDetailPage;

  set showDetailPage(bool isDetailPageShown) =>
      {
        _showDetailPage = isDetailPageShown,
        notifyListeners(),
      };
}
