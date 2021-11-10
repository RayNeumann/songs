import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/song.dart';
import '../common/config/app_config.dart';
import '../interfaces/i_web_service.dart';

class WebService implements IWebService {
  final AppConfig appConfig;

  WebService(this.appConfig);

  String? host;
  var url;
  String? xClientname;
  Map<String, String>? requestHeaders;

  Future<List<Song>> fetchSongs() async {
    host = AppConfig().host;
    xClientname = AppConfig().xClientName;

    requestHeaders = {
      'x-rapidapi-key': AppConfig().xRapidKey,
    };

    String _url = '$host/artists/16775/songs';
    try {
      final response = await http.get(Uri.parse(_url), headers: requestHeaders);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        var _songsList = List<Song>.from(jsonResponse['response']['songs']
            .map((song) => Song.fromMap(song)));
        return _songsList;
      } else {
        throw Exception('Unexpected error occurred!');
      }
    } catch (e) {
      //print(e);
      throw Exception("network request failed, http statuscode: $e");
    }
  }
}
