import 'package:flutter/material.dart';
import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/respository/channel_info_respository.dart';

class RightRowDetailsPage extends StatelessWidget {
  RightRowDetailsPage({
    Key? key,
    required this.listItemPlaylist,
  }) : super(key: key);

  final List<ItemModel> listItemPlaylist;
  String name = '';
  Future<String> _getNameChannel(String channelKey) async {
    var res =
        await Injection.get<ChannelInfoRepository>().getChannelInfo(channelKey);

    for (var i = 0; i < res.items.length; i++) {
      name = res.items[i].snippet.title!;
    }
    return name.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        listItemPlaylist.length,
        (i) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                    image: NetworkImage(
                  listItemPlaylist[i].snippet.thumbnails!.medium?.url ?? '',
                )),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listItemPlaylist[i].snippet.title ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      listItemPlaylist[i].statistics?.viewCount ?? '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ' ${_getNameChannel(listItemPlaylist[i].snippet.channelId!)}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      listItemPlaylist[i]
                              .contentDetails
                              ?.relatedPlaylists
                              .likes ??
                          '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
