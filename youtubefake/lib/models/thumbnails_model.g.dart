// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnails_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailsModel _$ThumbnailsModelFromJson(Map<String, dynamic> json) =>
    ThumbnailsModel(
      thumbnailsDefault: json['thumbnailsDefault'] == null
          ? null
          : DefaultModel.fromJson(
              json['thumbnailsDefault'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : DefaultModel.fromJson(json['medium'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : DefaultModel.fromJson(json['high'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailsModelToJson(ThumbnailsModel instance) =>
    <String, dynamic>{
      'thumbnailsDefault': instance.thumbnailsDefault,
      'medium': instance.medium,
      'high': instance.high,
    };
