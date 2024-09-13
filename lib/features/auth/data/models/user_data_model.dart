import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.g.dart';
part 'user_data_model.freezed.dart';

/// A data model representing user information.
///
/// This class uses the `freezed` package to generate immutable data structures
/// with built-in JSON serialization/deserialization. It includes fields for user
/// details such as user ID, username, and phone number.
@freezed
class UserDataModel with _$UserDataModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserDataModel({
    @JsonKey(name: "id") String? uId,
    @JsonKey(name: "user_name") required String username,
    @JsonKey(name: "phone_number") required String phoneNumber,
  }) = UserData;

  /// Creates an instance of [UserDataModel] from a JSON map.
  ///
  /// This factory constructor allows the deserialization of JSON data into
  /// a [UserDataModel] instance.
  ///
  /// Parameters:
  /// - [json]: A map representing the JSON data to be deserialized.
  ///
  /// Returns:
  /// - [UserDataModel]: The instance created from the JSON data.
  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}