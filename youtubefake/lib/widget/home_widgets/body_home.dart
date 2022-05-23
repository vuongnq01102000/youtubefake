import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/respository/channel_info_respository.dart';
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
  ScrollController scrollController = ScrollController();
  ScrollController gridController = ScrollController();
  double point = 0;
  List<ChannelModel> listChannel = [];
  @override
  void initState() {
    scrollController.addListener(() {});

    _getInfoChannel();
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
                  list: listCategoryChip,
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
                  child: GridView.builder(
                    controller: gridController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.25,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 3),
                    itemBuilder: (ctx, i) {
                      return CardReviewVideo(
                          title: listCardThumbnailModel[i].title,
                          subtitle: listCardThumbnailModel[i].subtitle,
                          avtPath: listCardThumbnailModel[i].avtPath ?? '',
                          imgPath: listCardThumbnailModel[i].imgPath);
                    },
                    itemCount: listCardThumbnailModel.length,
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
                              listPlaylist.length,
                              (i) => ButtonListTileHomePage(
                                  icon: listPlaylist[i].icon!,
                                  title: listPlaylist[i].title!,
                                  func: () {})),
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
                                  children: List.generate(
                                      listChannel.length,
                                      (i) => ChannelSub(
                                          image: CachedNetworkImageProvider(
                                              listChannel[i]
                                                  .items[i]
                                                  .snippet
                                                  .thumbnails
                                                  .medium!
                                                  .url),
                                          title: listChannel[i]
                                              .items[i]
                                              .snippet
                                              .title,
                                          func: () {})),
                                )
                          : isloading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: List.generate(
                                      listChannel.length,
                                      (i) => ChannelSub(
                                          image: NetworkImage(listChannel[i]
                                              .items[i]
                                              .snippet
                                              .thumbnails
                                              .high!
                                              .url),
                                          title: listChannel[i]
                                              .items[i]
                                              .snippet
                                              .title,
                                          func: () {})),
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

  _getInfoChannel() async {
    var channelInfoList =
        await Injection.get<ChannelInfoRepository>().getChannelInfo();
    setState(() {
      isloading = false;
    });
    listChannel.add(channelInfoList);
  }
}
