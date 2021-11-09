import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:songs/common/config/app_config.dart';
import 'package:songs/models/song.dart';

class SongsListPage extends StatefulWidget {
  @override
  _SongsListPageState createState() => _SongsListPageState();
}

class _SongsListPageState extends State<SongsListPage> {
  Future<List<Song>>? futureSongs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _listViewModel = Provider.of<MerchantListViewModel>(context);
    futureSongs = fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchants ListView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: FutureBuilder<List<Song>>(
                    future: futureSongs,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Song>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.black,
                          ),
                          itemCount:
                              snapshot.hasData ? snapshot.data!.length : 0,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                child: ListTile(
                                  leading: snapshot.data![index]
                                          .songArtThumbnailUrl!.isEmpty
                                      ? Image.network(
                                          'http://placekitten.com/200/300')
                                      : Image.network(snapshot
                                          .data![index].songArtThumbnailUrl!),
                                  title: Text(snapshot.data![index].fullTitle
                                      .toString()),
                                ),
                                onTap: () => {
                                      /*_merchantViewModel = _listViewModel
                    .createMerchantViewModel(
                snapshot.data![index]),*/
                                      /*    _listViewModel.showDetailPage = true,*/
                                    });
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Text(
                            'has error'); // <- make an error screen here
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? host;
  var url;
  String? xClientname;
  Map<String, String>? requestHeaders;

  Future<List<Song>>? fetchSongs() async {
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
