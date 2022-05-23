import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/respository/channel_info_respository.dart';

class Injector {
  static void init() {
    Injection.put<ChannelInfoRepository>(ChannelInfoRepositoryImp());
  }
}
