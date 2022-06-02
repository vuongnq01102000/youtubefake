import 'package:dio/dio.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/utils/api_path.dart';

abstract class ChannelInfoRepository {
  Future<ChannelModel> getChannelInfo(String channelKey);
}

class ChannelInfoRepositoryImp implements ChannelInfoRepository {
  @override
  Future<ChannelModel> getChannelInfo(String channelKey) async {
    Map<String, String> param = {
      'part': 'snippet, statistics, contentDetails',
      'id': channelKey,
      'key': API_KEY,
    };
    var respone = await Dio().get(GET_CHANNELS_INFO, queryParameters: param);
    print(respone.data);
    return ChannelModel.fromJson(respone.data);
  }
}
