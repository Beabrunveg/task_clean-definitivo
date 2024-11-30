import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily.freezed.dart';
part 'daily.g.dart';

/// Daily is a widget that shows the daily.
/// Model class for the daily.
@freezed
class Daily with _$Daily {
  const factory Daily({
    required int id,
    required String day,
  }) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
