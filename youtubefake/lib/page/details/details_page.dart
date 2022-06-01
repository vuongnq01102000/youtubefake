import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/respository/playlist_items_repository.dart';
import 'package:youtubefake/respository/video_categories_repository.dart';
import 'package:youtubefake/widget/details_widgets/left_row_detail.dart';
import 'package:youtubefake/widget/details_widgets/right_row_detail.dart';
import 'package:youtubefake/widget/home_widgets/appbar_home.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isMore = false;
  bool isMoreChannel = false;
  bool isLoading = true;
  bool isContentLoading = true;
  ScrollController scrollController = ScrollController();
  ScrollController gridController = ScrollController();
  double point = 0;
  List<ChannelModel> listChannel = [];
  List<ItemModel> listItemPlaylist = [];
  List<ItemModel> listVideoCategories = [];
  List<ItemModel> listPlayLists = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: 'idLccry219k',
    params: const YoutubePlayerParams(
      startAt: Duration(minutes: 1, seconds: 36),
      showControls: true,
      showFullscreenButton: true,
      desktopMode: false,
      privacyEnhanced: true,
      useHybridComposition: true,
    ),
  );
  _getListPlayList() async {
    var listPlaylist =
        await Injection.get<PlaylistItemsRepository>().getListPlaylist();
    setState(() {
      listPlayLists.clear();
      listPlayLists.addAll(listPlaylist.items);
    });
  }

  _getPlaylistVideo() async {
    var playListVideo =
        await Injection.get<PlaylistItemsRepository>().getPlaylistItems();
    setState(() {
      isContentLoading = false;
      listItemPlaylist.clear();
      listItemPlaylist.addAll(playListVideo.items);
    });
  }

  _getVideoCategories() async {
    var videoCategories =
        await Injection.get<VideoCategoriesRepository>().getVideoCategories();
    setState(() {
      listVideoCategories.clear();
      listVideoCategories.addAll(videoCategories.items);
    });
  }

  @override
  void initState() {
    _getListPlayList();
    _getPlaylistVideo();
    _getVideoCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 100),
          child: AppBarHome(func: () => _key.currentState?.openDrawer())),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: LeftRowDetailsPage(
                    listPlayLists: listPlayLists,
                    youtubePlayerController: youtubePlayerController,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child:
                      RightRowDetailsPage(listItemPlaylist: listItemPlaylist),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
