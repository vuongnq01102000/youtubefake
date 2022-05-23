// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_playlists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedPlaylistsModel _$RelatedPlaylistsModelFromJson(
        Map<String, dynamic> json) =>
    RelatedPlaylistsModel(
      likes: json['likes'] as String,
      uploads: json['uploads'] as String,
    );

Map<String, dynamic> _$RelatedPlaylistsModelToJson(
        RelatedPlaylistsModel instance) =>
    <String, dynamic>{
      'likes': instance.likes,
      'uploads': instance.uploads,
    };
