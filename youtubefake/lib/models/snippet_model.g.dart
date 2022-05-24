// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnippetModel _$SnippetModelFromJson(Map<String, dynamic> json) => SnippetModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      assignable: json['assignable'] as bool? ?? false,
      channelId: json['channelId'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : ThumbnailsModel.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      localized: json['localized'] == null
          ? null
          : LocalizedModel.fromJson(json['localized'] as Map<String, dynamic>),
      country: json['country'] as String? ?? 'vn',
    );

Map<String, dynamic> _$SnippetModelToJson(SnippetModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'channelId': instance.channelId,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'assignable': instance.assignable,
      'thumbnails': instance.thumbnails,
      'localized': instance.localized,
      'country': instance.country,
    };
