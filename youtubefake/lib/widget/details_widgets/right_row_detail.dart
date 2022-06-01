import 'package:flutter/material.dart';
import 'package:youtubefake/models/item_model.dart';

class RightRowDetailsPage extends StatelessWidget {
  const RightRowDetailsPage({
    Key? key,
    required this.listItemPlaylist,
  }) : super(key: key);

  final List<ItemModel> listItemPlaylist;

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
                      listItemPlaylist[i].snippet.country ?? '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      listItemPlaylist[i].snippet.channelId ?? '',
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
