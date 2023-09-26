// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileModel _$$_UserProfileModelFromJson(Map<String, dynamic> json) =>
    _$_UserProfileModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      hasVerifiedEmail: json['hasVerifiedEmail'] as bool?,
    );

Map<String, dynamic> _$$_UserProfileModelToJson(_$_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'balance': instance.balance,
      'rating': instance.rating,
      'hasVerifiedEmail': instance.hasVerifiedEmail,
    };
