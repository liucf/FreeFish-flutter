import 'package:freezed_annotation/freezed_annotation.dart';
part 'subcategory_model.freezed.dart';
part 'subcategory_model.g.dart';

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    required int id,
    required String name,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
