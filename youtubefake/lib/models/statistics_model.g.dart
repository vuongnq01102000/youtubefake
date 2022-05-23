// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) =>
    StatisticsModel(
      viewCount: json['viewCount'] as String,
      subscriberCount: json['subscriberCount'] as String,
      hiddenSubscriberCount: json['hiddenSubscriberCount'] as bool,
      videoCount: json['videoCount'] as String,
    );

Map<String, dynamic> _$StatisticsModelToJson(StatisticsModel instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'subscriberCount': instance.subscriberCount,
      'hiddenSubscriberCount': instance.hiddenSubscriberCount,
      'videoCount': instance.videoCount,
    };
