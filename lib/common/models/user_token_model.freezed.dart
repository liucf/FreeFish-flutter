// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) {
  return _UserTokenModel.fromJson(json);
}

/// @nodoc
mixin _$UserTokenModel {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTokenModelCopyWith<UserTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenModelCopyWith<$Res> {
  factory $UserTokenModelCopyWith(
          UserTokenModel value, $Res Function(UserTokenModel) then) =
      _$UserTokenModelCopyWithImpl<$Res, UserTokenModel>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$UserTokenModelCopyWithImpl<$Res, $Val extends UserTokenModel>
    implements $UserTokenModelCopyWith<$Res> {
  _$UserTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserTokenModelCopyWith<$Res>
    implements $UserTokenModelCopyWith<$Res> {
  factory _$$_UserTokenModelCopyWith(
          _$_UserTokenModel value, $Res Function(_$_UserTokenModel) then) =
      __$$_UserTokenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_UserTokenModelCopyWithImpl<$Res>
    extends _$UserTokenModelCopyWithImpl<$Res, _$_UserTokenModel>
    implements _$$_UserTokenModelCopyWith<$Res> {
  __$$_UserTokenModelCopyWithImpl(
      _$_UserTokenModel _value, $Res Function(_$_UserTokenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_UserTokenModel(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTokenModel implements _UserTokenModel {
  const _$_UserTokenModel({required this.token});

  factory _$_UserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserTokenModelFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'UserTokenModel(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTokenModel &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTokenModelCopyWith<_$_UserTokenModel> get copyWith =>
      __$$_UserTokenModelCopyWithImpl<_$_UserTokenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTokenModelToJson(
      this,
    );
  }
}

abstract class _UserTokenModel implements UserTokenModel {
  const factory _UserTokenModel({required final String token}) =
      _$_UserTokenModel;

  factory _UserTokenModel.fromJson(Map<String, dynamic> json) =
      _$_UserTokenModel.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_UserTokenModelCopyWith<_$_UserTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
