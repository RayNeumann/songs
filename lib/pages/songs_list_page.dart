import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songs/models/song.dart';
import 'package:songs/view_models/song_list_view_model.dart';

class SongsListPage extends StatefulWidget {
  @override
  _SongsListPageState createState() => _SongsListPageState();
}

class _SongsListPageState extends State<SongsListPage> {
  Future<List<Song>>? futureSongs;
  late SongListViewModel _listViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listViewModel = Provider.of<SongListViewModel>(context);
    futureSongs = _listViewModel.fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs ListView'),
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
}
