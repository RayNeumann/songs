import '../models/song.dart';

/// An interface specifying the Webservice's functionality
abstract class IWebService {
  /// Queries a list of songs
  Future<List<Song>> fetchSongs();
}
