import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_thumb_model.freezed.dart';
part 'product_thumb_model.g.dart';

@freezed
class ProductThumbModel with _$ProductThumbModel {
  const factory ProductThumbModel({
    required String name,
  }) = _ProductThumbModel;

  factory ProductThumbModel.fromJson(Map<String, dynamic> json) =>
      _$ProductThumbModelFromJson(json);
}
