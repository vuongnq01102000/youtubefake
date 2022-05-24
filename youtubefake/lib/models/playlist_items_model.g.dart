// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListItemsModel _$PlayListItemsModelFromJson(Map<String, dynamic> json) =>
    PlayListItemsModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo:
          PageInfoModel.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayListItemsModelToJson(PlayListItemsModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'items': instance.items,
      'pageInfo': instance.pageInfo,
    };
