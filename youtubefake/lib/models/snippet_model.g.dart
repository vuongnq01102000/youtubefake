// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnippetModel _$SnippetModelFromJson(Map<String, dynamic> json) => SnippetModel(
      title: json['title'] as String,
      description: json['description'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      thumbnails:
          ThumbnailsModel.fromJson(json['thumbnails'] as Map<String, dynamic>),
      localized:
          LocalizedModel.fromJson(json['localized'] as Map<String, dynamic>),
      country: json['country'] as String,
    );

Map<String, dynamic> _$SnippetModelToJson(SnippetModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'thumbnails': instance.thumbnails,
      'localized': instance.localized,
      'country': instance.country,
    };
