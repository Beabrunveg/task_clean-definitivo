import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_task.freezed.dart';
part 'daily_task.g.dart';

/// DailyTask is a widget that shows the daily task.
/// Model class for the daily task.
@freezed
class DailyTask with _$DailyTask {
  const factory DailyTask({
    required int id,
    required int personId,
    required String taskName,
    required String taskDescription,
    required String date,
    required String hour,
    required bool isCompleted,
    required String color,
    required String comment,
    required String personName,
    required String image,
  }) = _DailyTask;

  factory DailyTask.fromJson(Map<String, dynamic> json) =>
      _$DailyTaskFromJson(json);
}
