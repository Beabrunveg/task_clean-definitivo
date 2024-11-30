import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/services/database_service.dart';

/// DatabaseRepository is a widget that shows the database repository.
/// Repository class for the database.
abstract class DatabaseRepository {
  /// Get user by email.
  Future<Either<Exception, User>> getUserByEmail(String email);

  /// Insert user.
  Future<Either<Exception, void>> insertUser(User user);

  /// Insert daily.
  Future<Either<Exception, void>> insertDaily(Daily daily);

  /// Update user.
  Future<Either<Exception, void>> updateUser(User user);

  /// Insert task.
  Future<Either<Exception, int?>> insertTask(DailyTask task);

  /// Get tasks for a given day.
  Future<Either<Exception, List<DailyTask>>> getTasksForDay(String date);

  /// Get time data.
  Future<Either<Exception, List<DailyTask>>> getTasksForPastDays();

  /// Update task completion.
  Future<Either<Exception, void>> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
    String comment,
  );

  /// Update task.
  Future<Either<Exception, void>> updateTask(DailyTask task);

  /// Delete task.
  Future<Either<Exception, void>> deleteTask(int id);

  /// Delete person.
  Future<Either<Exception, void>> deletePerson(int id);

  /// Get weekly task count.
  Future<Either<Exception, WeeklySummary>> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get daily past.
  Future<Either<Exception, List<Daily>>> getDailyPast();

  /// Insert inventory.
  Future<Either<Exception, int>> insertInventory(String name, String image);

  /// Delete inventory.
  Future<Either<Exception, void>> deleteInventory(int id);

  /// Get inventory.
  Future<Either<Exception, List<Inventory>>> getInventory();

  /// Insert person.
  Future<Either<Exception, void>> insertPerson(PersonData personData);

  /// Get person.
  Future<Either<Exception, PersonData>> getPerson(int id);

  /// List persons.
  Future<Either<Exception, List<PersonData>>> listPersons();

  /// Insert coupon.
  Future<Either<Exception, void>> insertCoupon(CouponData couponData);

  /// Get coupon.
  Future<Either<Exception, CouponData>> getCoupon(int id);

  /// List coupons.
  Future<Either<Exception, List<CouponData>>> listCoupons();

  /// Get time data.
  Future<Either<Exception, List<TimeData>>> getTimeData();
}

/// Lazy singleton implementation of the [DatabaseRepository].
@LazySingleton(as: DatabaseRepository)
class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this._databaseService);
  final DatabaseService _databaseService;

  /// Get user by email implementation.
  @override
  Future<Either<Exception, User>> getUserByEmail(String email) async {
    try {
      final user = await _databaseService.getUserByEmail(email);
      if (user == null) {
        return Left(Exception('User not found'));
      }
      return Right(user);
    } catch (e) {
      return Left(Exception('Failed to get user: $e'));
    }
  }

  /// Insert user implementation.
  @override
  Future<Either<Exception, void>> updateUser(User user) async {
    try {
      await _databaseService.updateUser(user.id, user);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update user: $e'));
    }
  }

  /// Insert user implementation.
  @override
  Future<Either<Exception, int?>> insertTask(DailyTask task) async {
    try {
      final id = await _databaseService.insertTask(task);
      return Right(id);
    } catch (e) {
      return Left(Exception('Failed to insert task: $e'));
    }
  }

  /// Get tasks for a given day implementation.
  @override
  Future<Either<Exception, List<DailyTask>>> getTasksForDay(
    String date,
  ) async {
    try {
      final tasks = await _databaseService.getTasksForDay(date);
      return Right(tasks);
    } catch (e) {
      return Left(Exception('Failed to get tasks for day: $e'));
    }
  }

  /// Update task completion implementation.
  @override
  Future<Either<Exception, void>> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
    String comment,
  ) async {
    try {
      await _databaseService.updateTaskCompletion(
        id,
        isCompleted,
        image,
        comment,
      );
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update task completion: $e'));
    }
  }

  /// Update task implementation.
  @override
  Future<Either<Exception, void>> updateTask(DailyTask task) async {
    try {
      await _databaseService.updateTask(task);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to update task: $e'));
    }
  }

  /// Delete task implementation.
  @override
  Future<Either<Exception, void>> deleteTask(int id) async {
    try {
      await _databaseService.deleteTask(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete task: $e'));
    }
  }

  /// Get weekly task count implementation.
  @override
  Future<Either<Exception, WeeklySummary>> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final summary =
          await _databaseService.getWeeklyTaskCount(startDate, endDate);
      return Right(summary);
    } catch (e) {
      return Left(Exception('Failed to get weekly task count: $e'));
    }
  }

  /// Get user by email implementation.
  @override
  Future<Either<Exception, void>> insertUser(User user) async {
    try {
      await _databaseService.insertUser(user);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert user: $e'));
    }
  }

  /// Insert daily implementation.
  @override
  Future<Either<Exception, void>> insertDaily(Daily daily) async {
    try {
      await _databaseService.insertDaily(daily);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert daily: $e'));
    }
  }

  /// Get daily past implementation.
  @override
  Future<Either<Exception, List<Daily>>> getDailyPast() async {
    try {
      final dailies = await _databaseService.getDailyPast();
      return Right(dailies);
    } catch (e) {
      return Left(Exception('Failed to get daily past: $e'));
    }
  }

  /// Delete inventory implementation.
  @override
  Future<Either<Exception, void>> deleteInventory(int id) async {
    try {
      await _databaseService.deleteInventory(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete inventory: $e'));
    }
  }

  /// Get inventory implementation.
  @override
  Future<Either<Exception, List<Inventory>>> getInventory() async {
    try {
      final inventory = await _databaseService.getInventory();
      return Right(inventory);
    } catch (e) {
      return Left(Exception('Failed to get inventory: $e'));
    }
  }

  /// Insert inventory implementation.
  @override
  Future<Either<Exception, int>> insertInventory(
    String name,
    String image,
  ) async {
    try {
      final id = await _databaseService.insertInventory(name, image);
      return Right(id);
    } catch (e) {
      return Left(Exception('Failed to insert inventory: $e'));
    }
  }

  /// get person by id implementation.
  @override
  Future<Either<Exception, PersonData>> getPerson(int id) async {
    try {
      final person = await _databaseService.getPerson(id);
      return Right(person);
    } catch (e) {
      return Left(Exception('Failed to get person: $e'));
    }
  }

  /// Insert person implementation.
  @override
  Future<Either<Exception, void>> insertPerson(PersonData personData) async {
    try {
      await _databaseService.insertPerson(personData);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert person: $e'));
    }
  }

  /// List persons implementation.
  @override
  Future<Either<Exception, List<PersonData>>> listPersons() async {
    try {
      final persons = await _databaseService.listPersons();
      return Right(persons);
    } catch (e) {
      return Left(Exception('Failed to list persons: $e'));
    }
  }

  /// Get coupon implementation.
  @override
  Future<Either<Exception, CouponData>> getCoupon(int id) async {
    try {
      final coupon = await _databaseService.getCoupon(id);
      return Right(coupon);
    } catch (e) {
      return Left(Exception('Failed to get coupon: $e'));
    }
  }

  /// Insert coupon implementation.
  @override
  Future<Either<Exception, void>> insertCoupon(CouponData couponData) async {
    try {
      await _databaseService.insertCoupon(couponData);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to insert coupon: $e'));
    }
  }

  /// List coupons implementation.
  @override
  Future<Either<Exception, List<CouponData>>> listCoupons() async {
    try {
      final coupons = await _databaseService.listCoupons();
      return Right(coupons);
    } catch (e) {
      return Left(Exception('Failed to list coupons: $e'));
    }
  }

  /// Get tasks for past days implementation.
  @override
  Future<Either<Exception, List<DailyTask>>> getTasksForPastDays() async {
    try {
      final tasks = await _databaseService.getTasksForPastDay();
      return Right(tasks);
    } catch (e) {
      return Left(Exception('Failed to get tasks for past days: $e'));
    }
  }

  /// Delete person implementation.
  @override
  Future<Either<Exception, void>> deletePerson(int id) async {
    try {
      await _databaseService.deletePerson(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete person: $e'));
    }
  }

  /// Get time data implementation.
  @override
  Future<Either<Exception, List<TimeData>>> getTimeData() async {
    try {
      final timeData = await _databaseService.getTimeData();
      return Right(timeData);
    } catch (e) {
      return Left(Exception('Failed to get time data: $e'));
    }
  }
}
