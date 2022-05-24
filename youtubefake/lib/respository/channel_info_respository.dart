import 'package:dio/dio.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/utils/api_path.dart';

abstract class ChannelInfoRepository {
  Future<ChannelModel> getChannelInfo();
}

class ChannelInfoRepositoryImp implements ChannelInfoRepository {
  @override
  Future<ChannelModel> getChannelInfo() async {
    Map<String, String> param = {
      'part': 'snippet, statistics, contentDetails',
      'id': CHANNEL_KEY,
      'key': API_KEY,
    };
    var respone = await Dio().get(GET_CHANNELS_INFO, queryParameters: param);

    return ChannelModel.fromJson(respone.data);
  }
}
