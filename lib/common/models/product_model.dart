// ignore_for_file: non_constant_identifier_names

import 'package:freefish/common/models/product_thumb_model.dart';
import 'package:freefish/common/models/user_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required int user_id,
    required String name,
    required String description,
    required String? created_at,
    required double price,
    required List<ProductThumbModel> thumbs,
    UserProfileModel? user,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
