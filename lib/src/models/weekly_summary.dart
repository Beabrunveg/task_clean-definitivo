import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taks_daily_app/src/models/daily_task.dart'; // Asegúrate de importar el modelo DailyTask

part 'weekly_summary.freezed.dart';
part 'weekly_summary.g.dart';

/// WeeklySummary is a widget that shows the weekly summary.
/// Model class for the weekly summary.
@freezed
class WeeklySummary with _$WeeklySummary {
  const factory WeeklySummary({
    required DateTime startDate,
    required DateTime endDate,
    required int totalTasks,
    required List<DailyTask> tasks, // Lista de tareas diarias
  }) = _WeeklySummary;

  factory WeeklySummary.fromJson(Map<String, dynamic> json) =>
      _$WeeklySummaryFromJson(json);
}
