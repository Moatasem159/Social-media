// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCredintialImpl _$$UserCredintialImplFromJson(Map<String, dynamic> json) =>
    _$UserCredintialImpl(
      uId: json['id'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['user_name'] as String,
      phoneNumber: json['phone_number'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
    );

Map<String, dynamic> _$$UserCredintialImplToJson(
        _$UserCredintialImpl instance) =>
    <String, dynamic>{
      'id': instance.uId,
      'email': instance.email,
      'password': instance.password,
      'user_name': instance.username,
      'phone_number': instance.phoneNumber,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
    };
