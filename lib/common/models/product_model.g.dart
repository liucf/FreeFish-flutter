// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      created_at: json['created_at'] as String?,
      price: (json['price'] as num).toDouble(),
      thumbs: (json['thumbs'] as List<dynamic>)
          .map((e) => ProductThumbModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserProfileModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at,
      'price': instance.price,
      'thumbs': instance.thumbs,
      'user': instance.user,
    };
