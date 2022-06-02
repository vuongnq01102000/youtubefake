import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/page/details/details_page.dart';
import 'package:youtubefake/respository/channel_info_respository.dart';
import 'package:youtubefake/respository/playlist_items_repository.dart';
import 'package:youtubefake/respository/video_categories_repository.dart';
import 'package:youtubefake/utils/api_path.dart';
import 'package:youtubefake/utils/list_data_fake.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/button_list_tile_widget.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/card_review_thumbnail_widget.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/channel_sub_widget.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/choice_chip_category_widget.dart';

class BodyHomePage extends StatefulWidget {
  final bool isExpand;
  const BodyHomePage({
    this.isExpand = false,
    Key? key,
  }) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  bool isMore = false;
  bool isMoreChannel = false;
  bool isloading = true;
  bool isContentLoading = true;
  ScrollController scrollController = ScrollController();
  ScrollController gridController = ScrollController();
  double point = 0;
  List<ChannelModel> listChannel = [];
  List<ItemModel> listItemPlaylist = [];
  List<ItemModel> listVideoCategories = [];
  List<ItemModel> listPlayLists = [];

  @override
  void initState() {
    scrollController.addListener(() {});
    _getVideoCategories();
    _getPlaylistVideo();

    _getListPlayList();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _sideBarMenu(),
        _contentRight(),
      ],
    );
  }

  Expanded _contentRight() {
    return Expanded(
        flex: widget.isExpand ? 12 : 8,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ChoiceChipCategoryHomePage(
                  scrollController: scrollController,
                  list: listVideoCategories,
                  funcDeres: () {
                    point = point - 50;
                    scrollController.animateTo(point,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                    setState(() {});
                  },
                  funcIncre: () {
                    point = point + 50;
                    scrollController.animateTo(point,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                    setState(() {});
                  }),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: isContentLoading
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                          controller: gridController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.25,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 3),
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return const DetailsPage();
                                }));
                              },
                              child: CardReviewVideo(
                                  title:
                                      listItemPlaylist[i].snippet.title ?? '',
                                  subtitle:
                                      listItemPlaylist[i].snippet.description ??
                                          '',
                                  avtPath: listItemPlaylist[i]
                                          .snippet
                                          .thumbnails!
                                          .medium
                                          ?.url ??
                                      '',
                                  imgPath: listItemPlaylist[i]
                                          .snippet
                                          .thumbnails!
                                          .high
                                          ?.url ??
                                      ''),
                            );
                          },
                          itemCount: listItemPlaylist.length,
                        ),
                ),
              ),
            ),
          ],
        ));
  }

  Expanded _sideBarMenu() {
    return Expanded(
        flex: widget.isExpand ? 1 : 2,
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(
                      listButton.length,
                      (i) => widget.isExpand
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: IconButton(
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: Icon(listButton[i].icon)),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            )
                          : ButtonListTileHomePage(
                              icon: listButton[i].icon!,
                              title: listButton[i].title!,
                              func: () {})),
                ),
                if (!widget.isExpand) const Divider(),
                if (!widget.isExpand)
                  Column(
                    children: [
                      Column(
                        children: List.generate(
                            listButtonMidle.length,
                            (i) => ButtonListTileHomePage(
                                icon: listButtonMidle[i].icon!,
                                title: listButtonMidle[i].title!,
                                func: () {})),
                      ),
                      if (isMore)
                        Column(
                          children: List.generate(
                              listPlayLists.length,
                              (i) => ListTile(
                                    leading: CircleAvatar(
                                      maxRadius: 20,
                                      minRadius: 10,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              listPlayLists[i]
                                                      .snippet
                                                      .thumbnails!
                                                      .medium
                                                      ?.url ??
                                                  ''),
                                    ),
                                    title: Text(
                                      listPlayLists[i].snippet.title ?? '',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                        ),
                      ListTile(
                        leading: Icon(isMore
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                        title: Text(
                          isMore ? 'Read Less' : 'Read More',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        onTap: () {
                          isMore = !isMore;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                if (!widget.isExpand) const Divider(),
                if (!widget.isExpand)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Channel Subscription',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                if (!widget.isExpand)
                  Column(
                    children: [
                      !isMoreChannel
                          ? isloading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: List.generate(4, (index) {
                                    for (var i = 0;
                                        i <= listChannel[index].items.length;
                                        i++) {
                                      return ChannelSub(
                                          image: CachedNetworkImageProvider(
                                              listChannel[index]
                                                  .items[i]
                                                  .snippet
                                                  .thumbnails!
                                                  .medium!
                                                  .url),
                                          title: listChannel[index]
                                                  .items[i]
                                                  .snippet
                                                  .title ??
                                              '',
                                          func: () {});
                                    }
                                    return Container();
                                  }),
                                )
                          : isloading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: List.generate(listChannel.length,
                                      (index) {
                                    for (var i = 0;
                                        i <= listChannel[index].items.length;
                                        i++) {
                                      return ChannelSub(
                                          image: CachedNetworkImageProvider(
                                              listChannel[index]
                                                  .items[i]
                                                  .snippet
                                                  .thumbnails!
                                                  .medium!
                                                  .url),
                                          title: listChannel[index]
                                                  .items[i]
                                                  .snippet
                                                  .title ??
                                              '',
                                          func: () {});
                                    }
                                    return Container();
                                  }),
                                ),
                      if (listChannel.length > 4)
                        ListTile(
                          leading: Icon(isMore
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                          title: Text(
                            isMoreChannel
                                ? 'Read Less'
                                : 'Read More ${listChannel.length} Channel',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          onTap: () {
                            isMoreChannel = !isMoreChannel;
                            setState(() {});
                          },
                        ),
                      const Divider(),
                    ],
                  ),
                if (!widget.isExpand)
                  Column(
                    children: [
                      Column(
                        children: List.generate(
                            listButtonServices1.length,
                            (i) => ButtonListTileHomePage(
                                icon: listButtonServices1[i].icon!,
                                title: listButtonServices1[i].title!,
                                func: () {})),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      Column(
                        children: List.generate(
                            listButtonServices2.length,
                            (i) => ButtonListTileHomePage(
                                icon: listButtonServices2[i].icon!,
                                title: listButtonServices2[i].title!,
                                func: () {})),
                      ),
                    ],
                  ),
                if (!widget.isExpand)
                  Wrap(
                    children: List.generate(
                      listTextTitle.length,
                      (index) => TextButton(
                        onPressed: () {},
                        child: Text(
                          listTextTitle[index],
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                if (!widget.isExpand)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "© 2022 Google LLC",
                        style: TextStyle(color: Colors.black26, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }

  _getPlaylistVideo() async {
    var playListVideo =
        await Injection.get<PlaylistItemsRepository>().getPlaylistItems();
    for (var i = 0; i < playListVideo.items.length; i++) {
      var channelInfoList = await Injection.get<ChannelInfoRepository>()
          .getChannelInfo(
              playListVideo.items[i].snippet.channelId ?? CHANNEL_KEY);
      listChannel.add(channelInfoList);
      print(channelInfoList);
    }
    setState(() {
      isContentLoading = false;
      isloading = false;
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

  _getListPlayList() async {
    var listPlaylist =
        await Injection.get<PlaylistItemsRepository>().getListPlaylist();
    setState(() {
      listPlayLists.clear();
      listPlayLists.addAll(listPlaylist.items);
    });
  }
}
