// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return UserCredintial.fromJson(json);
}

/// @nodoc
mixin _$UserDataModel {
  @JsonKey(name: "id")
  String? get uId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "user_name")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  DateTime get dateOfBirth => throw _privateConstructorUsedError;

  /// Serializes this UserDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataModelCopyWith<UserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataModelCopyWith<$Res> {
  factory $UserDataModelCopyWith(
          UserDataModel value, $Res Function(UserDataModel) then) =
      _$UserDataModelCopyWithImpl<$Res, UserDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? uId,
      String email,
      String password,
      @JsonKey(name: "user_name") String username,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "date_of_birth") DateTime dateOfBirth});
}

/// @nodoc
class _$UserDataModelCopyWithImpl<$Res, $Val extends UserDataModel>
    implements $UserDataModelCopyWith<$Res> {
  _$UserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = freezed,
    Object? email = null,
    Object? password = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_value.copyWith(
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCredintialImplCopyWith<$Res>
    implements $UserDataModelCopyWith<$Res> {
  factory _$$UserCredintialImplCopyWith(_$UserCredintialImpl value,
          $Res Function(_$UserCredintialImpl) then) =
      __$$UserCredintialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? uId,
      String email,
      String password,
      @JsonKey(name: "user_name") String username,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "date_of_birth") DateTime dateOfBirth});
}

/// @nodoc
class __$$UserCredintialImplCopyWithImpl<$Res>
    extends _$UserDataModelCopyWithImpl<$Res, _$UserCredintialImpl>
    implements _$$UserCredintialImplCopyWith<$Res> {
  __$$UserCredintialImplCopyWithImpl(
      _$UserCredintialImpl _value, $Res Function(_$UserCredintialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = freezed,
    Object? email = null,
    Object? password = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_$UserCredintialImpl(
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserCredintialImpl implements UserCredintial {
  const _$UserCredintialImpl(
      {@JsonKey(name: "id") this.uId,
      required this.email,
      required this.password,
      @JsonKey(name: "user_name") required this.username,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      @JsonKey(name: "date_of_birth") required this.dateOfBirth});

  factory _$UserCredintialImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCredintialImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? uId;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: "user_name")
  final String username;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  final DateTime dateOfBirth;

  @override
  String toString() {
    return 'UserDataModel(uId: $uId, email: $email, password: $password, username: $username, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCredintialImpl &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uId, email, password, username, phoneNumber, dateOfBirth);

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCredintialImplCopyWith<_$UserCredintialImpl> get copyWith =>
      __$$UserCredintialImplCopyWithImpl<_$UserCredintialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCredintialImplToJson(
      this,
    );
  }
}

abstract class UserCredintial implements UserDataModel {
  const factory UserCredintial(
      {@JsonKey(name: "id") final String? uId,
      required final String email,
      required final String password,
      @JsonKey(name: "user_name") required final String username,
      @JsonKey(name: "phone_number") required final String phoneNumber,
      @JsonKey(name: "date_of_birth")
      required final DateTime dateOfBirth}) = _$UserCredintialImpl;

  factory UserCredintial.fromJson(Map<String, dynamic> json) =
      _$UserCredintialImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get uId;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: "user_name")
  String get username;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  DateTime get dateOfBirth;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCredintialImplCopyWith<_$UserCredintialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
