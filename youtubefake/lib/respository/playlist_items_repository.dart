import 'package:dio/dio.dart';
import 'package:youtubefake/models/playlist_items_model.dart';
import 'package:youtubefake/utils/api_path.dart';

abstract class PlaylistItemsRepository {
  Future<PlayListItemsModel> getPlaylistItems();
  Future<PlayListItemsModel> getListPlaylist();
}

class PlaylistItemsRepositoryImp implements PlaylistItemsRepository {
  @override
  Future<PlayListItemsModel> getPlaylistItems() async {
    Map<String, String> param = {
      'part': 'snippet',
      'maxResults': '10',
      'playlistId': PLAYLIST_KEY,
      'key': API_KEY,
    };
    var respone = await Dio().get(GET_PLAYLIST_VIDEO, queryParameters: param);

    return PlayListItemsModel.fromJson(respone.data);
  }

  @override
  Future<PlayListItemsModel> getListPlaylist() async {
    Map<String, String> param = {
      'part': 'snippet',
      'maxResults': '10',
      'channelId': 'UC7REKZZDEuFQj23lWPH5rfg',
      'key': API_KEY,
    };
    var respone = await Dio().get(GET_LIST_PLAYLIST, queryParameters: param);

    return PlayListItemsModel.fromJson(respone.data);
  }
}
