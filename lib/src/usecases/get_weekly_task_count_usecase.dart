import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';
/// LazySingleton service implementation for the DatabaseService.
@lazySingleton
class GetWeeklyTaskCount {
  GetWeeklyTaskCount(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<WeeklySummary>>> execute() async {
    /// List to store the weekly summaries.
    final weeklySummary = <WeeklySummary>[];
    const numberOfWeeks = 4;
    final weeksList = getPreviousWeeksDates(numberOfWeeks);
    for (final weekDates in weeksList) {
      for (final date in weekDates) {
        final result = await repository.getWeeklyTaskCount(
          date,
          date,
        );
        result.fold((l) {}, (r) {
          log('WeeklySummary: ${r.tasks}');
          weeklySummary.add(r);
        });
      }
    }
    return weeklySummary.isEmpty ? right([]) : right(weeklySummary);
  }
}
/// Function to get the dates of the previous weeks.
List<List<DateTime>> getPreviousWeeksDates(int numberOfWeeks) {
  final now = DateTime.now();
  final startOfCurrentWeek = _findFirstMonday(now);

  /// List to store the dates of the weeks.
  final weeksDatesList = <List<DateTime>>[];

  var startOfWeek = startOfCurrentWeek
      .subtract(const Duration(days: 7)); /// Start from the previous week.
  for (var i = 0; i < numberOfWeeks; i++) {
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    final weekDates = <DateTime>[];

    for (var date = startOfWeek;
        date.isBefore(endOfWeek.add(const Duration(days: 1)));
        date = date.add(const Duration(days: 1))) {
      weekDates.add(date);
    }

    weeksDatesList.add(weekDates);

    /// Move to the previous week.
    startOfWeek = startOfWeek.subtract(const Duration(days: 7));
  }

  return weeksDatesList;
}
/// Function to get the first Monday of the week.
DateTime _findFirstMonday(DateTime date) {
  final weekday = date.weekday;
  final daysToSubtract =
      (weekday == DateTime.monday) ? 0 : ((weekday - DateTime.monday + 7) % 7);
  return date.subtract(Duration(days: daysToSubtract));
}
