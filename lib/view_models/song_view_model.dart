// Project imports:
import 'package:songs/models/song.dart';

class SongViewModel {
  final Song? song;

  SongViewModel({this.song});

  int? get id => song!.id;

  String? get fullTitle => song!.fullTitle;

  String? get songArtThumbnailUrl => song!.songArtThumbnailUrl;

  String? get songArtImageUrl => song!.songArtImageUrl;

  String? get lyricsUrl => song!.lyricsUrl;

}
