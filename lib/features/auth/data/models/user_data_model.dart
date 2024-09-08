import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_model.g.dart';
part 'user_data_model.freezed.dart';
@freezed
class UserDataModel with _$UserDataModel {

  @JsonSerializable(explicitToJson: true)
  const factory UserDataModel({
    @JsonKey(name: "id") String ?uId,
    required String email,
    required String password,
    @JsonKey(name: "user_name") required String username,
    @JsonKey(name: "phone_number") required String phoneNumber,
    @JsonKey(name: "date_of_birth") required DateTime dateOfBirth,
  }) = UserCredintial;
  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}