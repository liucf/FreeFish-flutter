// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_thumb_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductThumbModel _$ProductThumbModelFromJson(Map<String, dynamic> json) {
  return _ProductThumbModel.fromJson(json);
}

/// @nodoc
mixin _$ProductThumbModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductThumbModelCopyWith<ProductThumbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductThumbModelCopyWith<$Res> {
  factory $ProductThumbModelCopyWith(
          ProductThumbModel value, $Res Function(ProductThumbModel) then) =
      _$ProductThumbModelCopyWithImpl<$Res, ProductThumbModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ProductThumbModelCopyWithImpl<$Res, $Val extends ProductThumbModel>
    implements $ProductThumbModelCopyWith<$Res> {
  _$ProductThumbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductThumbModelCopyWith<$Res>
    implements $ProductThumbModelCopyWith<$Res> {
  factory _$$_ProductThumbModelCopyWith(_$_ProductThumbModel value,
          $Res Function(_$_ProductThumbModel) then) =
      __$$_ProductThumbModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_ProductThumbModelCopyWithImpl<$Res>
    extends _$ProductThumbModelCopyWithImpl<$Res, _$_ProductThumbModel>
    implements _$$_ProductThumbModelCopyWith<$Res> {
  __$$_ProductThumbModelCopyWithImpl(
      _$_ProductThumbModel _value, $Res Function(_$_ProductThumbModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_ProductThumbModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductThumbModel implements _ProductThumbModel {
  const _$_ProductThumbModel({required this.name});

  factory _$_ProductThumbModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductThumbModelFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'ProductThumbModel(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductThumbModel &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductThumbModelCopyWith<_$_ProductThumbModel> get copyWith =>
      __$$_ProductThumbModelCopyWithImpl<_$_ProductThumbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductThumbModelToJson(
      this,
    );
  }
}

abstract class _ProductThumbModel implements ProductThumbModel {
  const factory _ProductThumbModel({required final String name}) =
      _$_ProductThumbModel;

  factory _ProductThumbModel.fromJson(Map<String, dynamic> json) =
      _$_ProductThumbModel.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ProductThumbModelCopyWith<_$_ProductThumbModel> get copyWith =>
      throw _privateConstructorUsedError;
}
