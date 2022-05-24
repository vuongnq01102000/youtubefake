// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategoriesModel _$VideoCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    VideoCategoriesModel(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoCategoriesModelToJson(
        VideoCategoriesModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'items': instance.items,
    };
