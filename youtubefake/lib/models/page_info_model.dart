import 'package:json_annotation/json_annotation.dart';

part 'page_info_model.g.dart';

@JsonSerializable()
class PageInfoModel {
  PageInfoModel({
    required this.totalResults,
    required this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PageInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoModelToJson(this);
}
