import 'package:dio/dio.dart';
import 'package:youtubefake/models/video_categories_model.dart';
import 'package:youtubefake/utils/api_path.dart';

abstract class VideoCategoriesRepository {
  Future<VideoCategoriesModel> getVideoCategories();
}

class VideoCategoriesRepositoryImp implements VideoCategoriesRepository {
  @override
  Future<VideoCategoriesModel> getVideoCategories() async {
    Map<String, String> param = {
      'part': 'snippet',
      'regionCode': 'vn',
      'key': API_KEY
    };
    var respone = await Dio().get(GET_VIDEO_CATEGORIES, queryParameters: param);
    print(respone.data);

    return VideoCategoriesModel.fromJson(respone.data);
  }
}
