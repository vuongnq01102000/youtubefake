import 'package:flutter/material.dart';
import 'package:youtubefake/models/button_list_tile_model.dart';
import 'package:youtubefake/models/card_thumbnail_model.dart';
import 'package:youtubefake/models/channel_sub_model.dart';
import 'package:youtubefake/utils/api_path.dart';

List<ChannelSubModel> listChannelSubModel = <ChannelSubModel>[
  ChannelSubModel(
    image: const NetworkImage(IMG1),
    title: 'Channel 1',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG2),
    title: 'Channel 2',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG3),
    title: 'Channel 3',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG4),
    title: 'Channel 4',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG5),
    title: 'Channel 5',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG6),
    title: 'Channel 6',
  ),
  ChannelSubModel(
    image: const NetworkImage(IMG7),
    title: 'Channel 7',
  ),
];
List<ButtonListTileModel> listButton = <ButtonListTileModel>[
  ButtonListTileModel(
    icon: Icons.home,
    title: 'Home',
  ),
  ButtonListTileModel(
    icon: Icons.movie,
    title: 'Short',
  ),
  ButtonListTileModel(
    icon: Icons.moving_outlined,
    title: 'Adventure',
  ),
  ButtonListTileModel(
    icon: Icons.subscriptions,
    title: 'Subscriptions',
  ),
];
List<ButtonListTileModel> listButtonMidle = <ButtonListTileModel>[
  ButtonListTileModel(
    icon: Icons.video_library_outlined,
    title: 'Library',
  ),
  ButtonListTileModel(
    icon: Icons.restore,
    title: 'Restore Video',
  ),
  ButtonListTileModel(
    icon: Icons.smart_display_outlined,
    title: 'My video',
  ),
  ButtonListTileModel(
    icon: Icons.query_builder,
    title: 'Video Later',
  ),
  ButtonListTileModel(
    icon: Icons.thumb_up_alt_outlined,
    title: 'Like Video',
  ),
];
List<ButtonListTileModel> listButtonServices1 = <ButtonListTileModel>[
  ButtonListTileModel(
    icon: Icons.games,
    title: 'Games',
  ),
  ButtonListTileModel(
    icon: Icons.live_tv,
    title: 'Live Streams',
  ),
  ButtonListTileModel(
    icon: Icons.sports,
    title: 'Sports',
  ),
];
List<ButtonListTileModel> listButtonServices2 = <ButtonListTileModel>[
  ButtonListTileModel(
    icon: Icons.settings_outlined,
    title: 'Settings',
  ),
  ButtonListTileModel(
    icon: Icons.history_outlined,
    title: 'History',
  ),
  ButtonListTileModel(
    icon: Icons.help_outline,
    title: 'Help',
  ),
  ButtonListTileModel(
    icon: Icons.report_outlined,
    title: 'Report',
  ),
];
List<ButtonListTileModel> listPlaylist = <ButtonListTileModel>[
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 1',
  ),
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 2',
  ),
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 3',
  ),
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 4',
  ),
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 5',
  ),
  ButtonListTileModel(
    icon: Icons.playlist_play,
    title: 'Playlist 6',
  ),
];

List<String> listTextTitle = <String>[
  "Introduce",
  "Magazine",
  "Coppyright",
  "Contact",
  "Creator",
  "Advetise",
  "Developer",
  "Term",
  "Privacy",
  "Policy & Safety",
  "How YouTube works",
  "Test new features",
];
List<String> listCategoryChip = <String>[
  "All",
  "Music",
  "Gaming",
  "Youth Music",
  "Lo-fi",
  "Esport",
  "Futsal",
  "Football",
  "Humans",
  "Live",
  "Flutter Tips",
  "How To Fix Bugs",
  "Welcome to VIET NAM",
];

List<CardThumnailsModel> listCardThumbnailModel = <CardThumnailsModel>[
  CardThumnailsModel(
      'Video 1',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG1,
      THUMBNAIL1),
  CardThumnailsModel(
      'Video 2',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG2,
      THUMBNAIL2),
  CardThumnailsModel(
      'Video 3',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG3,
      THUMBNAIL3),
  CardThumnailsModel(
      'Video 4',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG4,
      THUMBNAIL4),
  CardThumnailsModel(
      'Video 5',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG5,
      THUMBNAIL5),
  CardThumnailsModel(
      'Video 6',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG6,
      THUMBNAIL6),
  CardThumnailsModel(
      'Video 7',
      'Day la cai subtitle cho moi nguoi mo ta ngan ve video',
      IMG7,
      THUMBNAIL7),
];
