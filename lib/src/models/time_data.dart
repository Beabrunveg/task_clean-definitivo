import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_data.freezed.dart';
part 'time_data.g.dart';

/// TimeData is a widget that shows the time data.
/// Model class for the time data.
@freezed
class TimeData with _$TimeData {
  const factory TimeData({
    int? id,
    String? name,
    String? time,
  }) = _TimeData;

  factory TimeData.fromJson(Map<String, dynamic> json) =>
      _$TimeDataFromJson(json);
}
