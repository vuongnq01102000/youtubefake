// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:youtubefake/models/channel_model.dart';
// import 'package:youtubefake/utils/api_path.dart';

// class ApiClient {
//   static Future<ChannelModel> getInfoChannel() async {
//     Response res;
//     Map<String, String> param = {
//       'part': 'snippet',
//       'part': 'statistics',
//       'part': 'contentDetails',
//       'id': CHANNEL_KEY,
//       'key': API_KEY,
//     };
//     // Map<String, String> headers = {
//     //   HttpHeaders.contentTypeHeader: 'application/json',
//     // };

//     try {
//       var respone = await Dio().get(GET_CHANNELS_INFO, queryParameters: param);
//       res = respone;
//       print(respone);
//     } catch (e) {
//       log('$e');
//     }
//     return ChannelModel.fromJson(res.data);
//   }
// }
