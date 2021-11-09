class Song {
  int? id;
  String? fullTitle;
  String? songArtThumbnailUrl;
  String? songArtImageUrl;
  String? lyricsUrl;

//<editor-fold desc="Data Methods">

  Song({
    this.id,
    this.fullTitle,
    this.songArtThumbnailUrl,
    this.songArtImageUrl,
    this.lyricsUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          fullTitle == other.fullTitle &&
          songArtThumbnailUrl == other.songArtThumbnailUrl &&
          songArtImageUrl == other.songArtImageUrl &&
          lyricsUrl == other.lyricsUrl);

  @override
  int get hashCode =>
      id.hashCode ^
      fullTitle.hashCode ^
      songArtThumbnailUrl.hashCode ^
      songArtImageUrl.hashCode ^
      lyricsUrl.hashCode;

  @override
  String toString() {
    return 'Song{' +
        ' id: $id,' +
        ' fullTitle: $fullTitle,' +
        ' songArtThumbnailUrl: $songArtThumbnailUrl,' +
        ' songArtImageUrl: $songArtImageUrl,' +
        ' lyricsUrl: $lyricsUrl,' +
        '}';
  }

  Song copyWith({
    int? id,
    String? fullTitle,
    String? songArtThumbnailUrl,
    String? songArtImageUrl,
    String? lyricsUrl,
  }) {
    return Song(
      id: id ?? this.id,
      fullTitle: fullTitle ?? this.fullTitle,
      songArtThumbnailUrl: songArtThumbnailUrl ?? this.songArtThumbnailUrl,
      songArtImageUrl: songArtImageUrl ?? this.songArtImageUrl,
      lyricsUrl: lyricsUrl ?? this.lyricsUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'fullTitle': this.fullTitle,
      'songArtThumbnailUrl': this.songArtThumbnailUrl,
      'songArtImageUrl': this.songArtImageUrl,
      'lyricsUrl': this.lyricsUrl,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'] as int,
      fullTitle: map['full_title'] as String,
      songArtThumbnailUrl: map['song_art_image_thumbnail_url'] as String,
      songArtImageUrl: map['song_art_image_url'] as String,
      lyricsUrl: map['path'] as String,
    );
  }

//</editor-fold>
}
