import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_data.freezed.dart';
part 'person_data.g.dart';

/// PersonData is a widget that shows the person data.
/// Model class for the person data.
@freezed
class PersonData with _$PersonData {
  const factory PersonData({
    int? id,
    String? name,
    String? availability,
    int? age,
    String? image,
    String? color,
  }) = _PersonData;

  factory PersonData.fromJson(Map<String, dynamic> json) =>
      _$PersonDataFromJson(json);
}
