import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtubefake/models/button_list_tile_model.dart';
import 'package:youtubefake/models/channel_model.dart';
import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/utils/list_data_fake.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/button_list_tile_widget.dart';
import 'package:youtubefake/widget/home_widgets/body_widgets/channel_sub_widget.dart';

class SideBarMenu extends StatelessWidget {
  final bool isExpand;
  final bool isMore;
  final bool isMoreChannel;
  final bool isLoading;
  final Function func;
  final List<ButtonListTileModel> listButton;
  final List<ButtonListTileModel> listButtonMidle;
  final List<ChannelModel> listChannel;
  final List<ItemModel> listPlayLists;
  const SideBarMenu(
      {required this.listButton,
      required this.listButtonMidle,
      required this.listPlayLists,
      required this.listChannel,
      required this.func,
      required this.isMoreChannel,
      required this.isLoading,
      required this.isExpand,
      required this.isMore,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: isExpand ? 1 : 2,
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(
                      listButton.length,
                      (i) => isExpand
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
                if (!isExpand) const Divider(),
                if (!isExpand)
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
                        onTap: func.call(),
                      ),
                    ],
                  ),
                if (!isExpand) const Divider(),
                if (!isExpand)
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
                if (!isExpand)
                  Column(
                    children: [
                      !isMoreChannel
                          ? isLoading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: List.generate(
                                      listChannel.length,
                                      (i) => ChannelSub(
                                          image: CachedNetworkImageProvider(
                                              listChannel[i]
                                                  .items[i]
                                                  .snippet
                                                  .thumbnails!
                                                  .medium!
                                                  .url),
                                          title: listChannel[i]
                                                  .items[i]
                                                  .snippet
                                                  .title ??
                                              '',
                                          func: () {})),
                                )
                          : isLoading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: List.generate(
                                      listChannel.length,
                                      (i) => ChannelSub(
                                          image: NetworkImage(listChannel[i]
                                                  .items[i]
                                                  .snippet
                                                  .thumbnails!
                                                  .high
                                                  ?.url ??
                                              ''),
                                          title: listChannel[i]
                                                  .items[i]
                                                  .snippet
                                                  .title ??
                                              '',
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
                          onTap: func.call(),
                        ),
                      const Divider(),
                    ],
                  ),
                if (!isExpand)
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
                if (!isExpand)
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
                if (!isExpand)
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
}
