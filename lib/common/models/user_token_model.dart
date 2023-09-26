import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_token_model.freezed.dart';
part 'user_token_model.g.dart';

@freezed
class UserTokenModel with _$UserTokenModel {
  const factory UserTokenModel({
    required String token,
  }) = _UserTokenModel;

  factory UserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserTokenModelFromJson(json);
}
