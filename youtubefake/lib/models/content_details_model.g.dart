// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) =>
    ContentDetails(
      RelatedPlaylistsModel.fromJson(
          json['relatedPlaylists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'relatedPlaylists': instance.relatedPlaylists,
    };
