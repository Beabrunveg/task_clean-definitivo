import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/db/db_config.dart';
import 'package:taks_daily_app/src/models/inventory.dart';
import 'package:taks_daily_app/src/models/models.dart';

/// Database service for the app.
abstract class DatabaseService {
  Future<void> updateUser(int id, User user);
  Future<void> insertUser(User user);
  Future<User?> getUserByEmail(String email);
  Future<int?> insertTask(DailyTask task);
  Future<void> insertDaily(Daily daily);
  Future<List<DailyTask>> getTasksForDay(String date);
  Future<List<TimeData>> getTimeData();
  Future<List<DailyTask>> getTasksForPastDay();
  Future<void> updateTaskCompletion(
    int id,
    bool isCompleted,
    String imag,
    String comment,
  );
  Future<void> updateTask(DailyTask task);
  Future<void> deleteTask(int id);
  Future<void> deletePerson(int id);
  Future<WeeklySummary> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  );
  Future<List<Daily>> getDailyPast();

  Future<int> insertInventory(String name, String image);

  Future<void> deleteInventory(int id);

  Future<List<Inventory>> getInventory();

  Future<void> insertPerson(
    PersonData personData,
  );
  Future<PersonData> getPerson(int id);
  Future<List<PersonData>> listPersons();
  Future<void> insertCoupon(
    CouponData couponData,
  );
  Future<CouponData> getCoupon(int id);
  Future<List<CouponData>> listCoupons();
}

/// LazySingleton service implementation for the DatabaseService.
@LazySingleton(as: DatabaseService)

/// Implementation of the DatabaseService.
class DatabaseServiceImpl implements DatabaseService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<void> updateUser(int id, User user) async {
    await _databaseHelper.updateUser(
      id,
      user.name,
      user.email,
      user.password,
      user.phone,
      user.image,
    );
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final userMap = await _databaseHelper.getUserByEmail(email);
    if (userMap == null) return null;
    return User.fromJson(userMap);
  }

  @override
  Future<int?> insertTask(DailyTask task) async {
    final id = await _databaseHelper.insertTask(
      task.taskName,
      task.taskDescription,
      task.date,
      task.color,
      task.hour,
      task.image,
      task.personId.toString(),
    );
    return id;
  }

  @override
  Future<List<DailyTask>> getTasksForDay(String date) async {
    final tasksMap = await _databaseHelper.getTasksForDay(
      date,
    );
    return tasksMap.map((taskMap) {
      return DailyTask(
        personId: taskMap['personId'] as int,
        id: taskMap['id'] as int,
        taskName: taskMap['title'] as String,
        taskDescription: taskMap['description'] as String,
        date: date,
        isCompleted: (taskMap['isCompleted'] as int) == 1,
        color: taskMap['color'] as String,
        image: taskMap['image'] as String,
        comment: taskMap['comment'] as String,
        personName: taskMap['personName'] as String,
        hour: taskMap['hour'] as String,
      );
    }).toList();
  }

  @override
  Future<void> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
    String comment,
  ) async {
    await _databaseHelper.updateTaskCompletion(id, isCompleted, image, comment);
  }

  @override
  Future<void> updateTask(DailyTask task) async {
    await _databaseHelper.updateTask(
      task.id,
      task.taskName,
      task.taskDescription,
    );
  }

  @override
  Future<void> deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
  }

  @override
  Future<WeeklySummary> getWeeklyTaskCount(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final startDayFormat = '${startDate.day}-${startDate.month}-'
        '${startDate.year}';
    final endDayFormat = '${endDate.day}-${endDate.month}-'
        '${endDate.year}';
    final tasksMap = await _databaseHelper.getWeeklyTaskCount(
      startDayFormat,
      endDayFormat,
    );

    final taskList = tasksMap.map((taskMap) {
      return DailyTask(
        personId: taskMap['personId'] as int,
        id: taskMap['id'] as int,
        taskName: taskMap['title'] as String,
        taskDescription: taskMap['description'] as String,
        date: taskMap['date'] as String,
        isCompleted: (taskMap['isCompleted'] as int) == 1,
        color: taskMap['color'] as String,
        image: taskMap['image'] as String,
        comment: taskMap['comment'] as String,
        personName: taskMap['personName'] as String,
        hour: taskMap['hour'] as String,
      );
    }).toList();

    final totalTasks =
        tasksMap.fold<int>(0, (sum, item) => sum + (item['taskCount'] as int));

    return WeeklySummary(
      startDate: startDate,
      endDate: endDate,
      totalTasks: totalTasks,
      tasks: taskList,
    );
  }

  @override
  Future<void> insertUser(User user) async {
    await _databaseHelper.insertUser(
      user.name,
      user.email,
      user.password,
      user.phone,
      user.image,
    );
  }

  @override
  Future<void> insertDaily(Daily daily) async {
    await _databaseHelper.insertDay(
      daily.day,
    );
  }

  @override
  Future<List<Daily>> getDailyPast() async {
    final dailyMap = await _databaseHelper.getDaysPast();
    return dailyMap.map((dailyMap) {
      return Daily(
        id: dailyMap['id'] as int,
        day: dailyMap['date'] as String,
      );
    }).toList();
  }

  @override
  Future<void> deleteInventory(int id) async {
    await _databaseHelper.deleteInventory(id);
  }

  @override
  Future<List<Inventory>> getInventory() async {
    final inventoryMap = await _databaseHelper.getInventory();
    return inventoryMap.map((inventoryMap) {
      return Inventory(
        id: inventoryMap['id'] as int,
        name: inventoryMap['name'] as String,
        image: inventoryMap['image'] as String,
      );
    }).toList();
  }

  @override
  Future<int> insertInventory(String name, String image) async {
    return _databaseHelper.insertInventory(name, image);
  }

  @override
  Future<PersonData> getPerson(int id) async {
    final personMap = await _databaseHelper.getPerson(id);
    return PersonData.fromJson(personMap ?? {});
  }

  @override
  Future<void> insertPerson(PersonData personData) async {
    await _databaseHelper.insertPerson(
      personData.name ?? '',
      personData.age ?? 0,
      personData.availability ?? '',
      personData.image ?? '',
      personData.color ?? '',
    );
  }

  @override
  Future<List<PersonData>> listPersons() async {
    final personsMap = await _databaseHelper.listPersons();
    return personsMap.map((personMap) {
      return PersonData(
        id: personMap['id'] as int,
        name: personMap['name'] as String,
        availability: personMap['availability'] as String,
        age: int.parse(personMap['age'].toString()),
        image: personMap['image'] as String,
        color: personMap['color'] as String,
      );
    }).toList();
  }

  @override
  Future<CouponData> getCoupon(int id) async {
    final couponMap = await _databaseHelper.getCoupon(id);
    return CouponData.fromJson(couponMap ?? {});
  }

  @override
  Future<void> insertCoupon(CouponData couponData) async {
    await _databaseHelper.insertCoupon(
      couponData.cod ?? '',
      couponData.date ?? '',
      couponData.discount ?? '',
      couponData.title ?? '',
      couponData.description ?? '',
    );
  }

  @override
  Future<List<CouponData>> listCoupons() async {
    final couponsMap = await _databaseHelper.listCoupons();
    return couponsMap.map((couponsMap) {
      return CouponData(
        id: couponsMap['id'] as int,
        cod: couponsMap['cod'] as String,
        date: couponsMap['date'] as String,
        discount: couponsMap['discount'] as String,
        title: couponsMap['title'] as String,
        description: couponsMap['description'] as String,
      );
    }).toList();
  }

  @override
  Future<List<DailyTask>> getTasksForPastDay() async {
    final tasksMap = await _databaseHelper.getTasksPastDay();
    return tasksMap.map((taskMap) {
      return DailyTask(
        personId: taskMap['personId'] as int,
        id: taskMap['id'] as int,
        taskName: taskMap['title'] as String,
        taskDescription: taskMap['description'] as String,
        date: taskMap['taskDate'] as String,
        isCompleted: (taskMap['isCompleted'] as int) == 1,
        color: taskMap['color'] as String,
        image: taskMap['image'] as String,
        comment: taskMap['comment'] as String,
        personName: taskMap['personName'] as String,
        hour: taskMap['hour'] as String,
      );
    }).toList();
  }

  @override
  Future<void> deletePerson(int id) async {
    await _databaseHelper.deletePerson(id);
  }

  @override
  Future<List<TimeData>> getTimeData() async {
    final timeMap = await _databaseHelper.getPendingTaskNamesAndTimes();
    return timeMap.map((timeMap) {
      return TimeData(
        id: timeMap['id'] as int,
        name: timeMap['title'] as String,
        time: timeMap['hour'] as String,
      );
    }).toList();
  }
}
