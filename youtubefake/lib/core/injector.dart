import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/respository/channel_info_respository.dart';
import 'package:youtubefake/respository/playlist_items_repository.dart';
import 'package:youtubefake/respository/video_categories_repository.dart';

class Injector {
  static void init() {
    Injection.put<ChannelInfoRepository>(ChannelInfoRepositoryImp());
    Injection.put<PlaylistItemsRepository>(PlaylistItemsRepositoryImp());
    Injection.put<VideoCategoriesRepository>(VideoCategoriesRepositoryImp());
  }
}
