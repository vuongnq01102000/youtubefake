import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/widget/details_widgets/button_active_below_video.dart';

class LeftRowDetailsPage extends StatelessWidget {
  const LeftRowDetailsPage({
    Key? key,
    required this.listPlayLists,
    required this.youtubePlayerController,
  }) : super(key: key);

  final List<ItemModel> listPlayLists;
  final YoutubePlayerController youtubePlayerController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black,
            width: double.maxFinite,
            height: 500,
            child: YoutubeValueBuilder(
                controller: youtubePlayerController,
                builder: (ctx, value) {
                  return IconButton(
                      icon: Icon(
                        value.playerState == PlayerState.playing
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: value.isReady
                          ? () {
                              value.playerState == PlayerState.playing
                                  ? context.ytController.pause()
                                  : context.ytController.play();
                            }
                          : null);
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Title Video',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Numbers of view ' 'Date of upload video',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonActiveBelowVideo(
                  title: '238', icon: Icons.thumb_up_outlined, func: () {}),
              const SizedBox(
                width: 16,
              ),
              ButtonActiveBelowVideo(
                  title: 'DisLike',
                  icon: Icons.thumb_down_outlined,
                  func: () {}),
              const SizedBox(
                width: 16,
              ),
              ButtonActiveBelowVideo(
                  title: 'Create video', icon: Icons.cut_outlined, func: () {}),
              const SizedBox(
                width: 16,
              ),
              ButtonActiveBelowVideo(
                  title: 'Save video',
                  icon: Icons.playlist_add_outlined,
                  func: () {}),
              const SizedBox(
                width: 16,
              ),
              IconButton(
                  onPressed: () {},
                  splashRadius: 10,
                  icon: const Icon(Icons.more_horiz)),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FlutterLogo(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Name channel',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(180, 45)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Subcribe Channel',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      const Icon(
                        Icons.notifications,
                        size: 18,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '${listPlayLists.length} Comment',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(Icons.sort)),
                  Text(
                    'Sort By',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              listPlayLists.length,
              (i) => ListTile(
                leading: CircleAvatar(
                  maxRadius: 20,
                  minRadius: 10,
                  backgroundImage: CachedNetworkImageProvider(
                      listPlayLists[i].snippet.thumbnails!.medium?.url ?? ''),
                ),
                title: Text(
                  listPlayLists[i].snippet.title ?? '',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  listPlayLists[i].snippet.description ?? '',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
