import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User is a widget that shows the user.
/// Model class for the user.
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
