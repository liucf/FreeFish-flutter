import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required int id,
    required String name,
    String? email,
    double? balance,
    double? rating,
    bool? hasVerifiedEmail,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
