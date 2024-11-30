import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// Helper class to interact with the SQLite database.
class DatabaseHelper {
  /// Factory constructor to return the singleton instance.
  factory DatabaseHelper() => _instance;

  /// Private constructor to prevent instantiation from outside.
  DatabaseHelper._internal();

  /// Singleton instance of the database helper.
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  /// Private instance of the database.
  static Database? _database;

  /// Returns the database instance, initializing it if necessary.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the database and creates the tables if they don't exist.
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'app_database.db');
    return openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        // Create the 'coupon' table
        await db.execute(
          'CREATE TABLE coupon(id INTEGER PRIMARY KEY, cod TEXT, date TEXT,discount TEXT,title TEXT,description TEXT)',
        );

        // Create the 'user' table
        await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, email TEXT UNIQUE, password TEXT, phone TEXT, image TEXT)',
        );

        // Create the 'person' table
        await db.execute(
          'CREATE TABLE person(id INTEGER PRIMARY KEY, name TEXT, availability TEXT, age TEXT, image TEXT, color TEXT)',
        );

        // Create the 'days' table
        await db.execute(
          'CREATE TABLE days(id INTEGER PRIMARY KEY, date TEXT UNIQUE)',
        );

        // Create the 'inventory' table
        await db.execute(
          'CREATE TABLE inventory(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
        );

        // Create the 'tasks' table with foreign keys to 'days' and 'person'
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER DEFAULT 0, dayId INTEGER, personId INTEGER, color TEXT, image TEXT, comment TEXT, hour TEXT, FOREIGN KEY(dayId) REFERENCES days(id) ON DELETE CASCADE, FOREIGN KEY(personId) REFERENCES person(id) ON DELETE SET NULL)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Upgrade logic from version 2 to 3
        if (oldVersion < 3) {
          // Add 'phone' column to 'user' table if it doesn't exist
          final columns = await db.rawQuery('PRAGMA table_info(user)');
          final columnNames =
              columns.map((col) => col['name']! as String).toList();
          if (!columnNames.contains('phone')) {
            await db.execute('ALTER TABLE user ADD COLUMN phone TEXT');
          }

          // Add 'color' column to 'tasks' table if it doesn't exist
          final taskColumns = await db.rawQuery('PRAGMA table_info(tasks)');
          final taskColumnNames =
              taskColumns.map((col) => col['name']! as String).toList();
          if (!taskColumnNames.contains('color')) {
            await db.execute('ALTER TABLE tasks ADD COLUMN color TEXT');
          }

          // Create 'inventory' table if it doesn't exist
          await db.execute(
            'CREATE TABLE IF NOT EXISTS inventory(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
          );
        }
      },
    );
  }

  /// Updates a user in the database.
  Future<void> updateUser(
    int id,
    String name,
    String email,
    String password,
    String phone,
    String image,
  ) async {
    final db = await database;
    await db.update(
      'user',
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'image': image,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Inserts a new user into the database.
  Future<int> insertUser(
    String name,
    String email,
    String password,
    String phone,
    String iamge,
  ) async {
    final db = await database;

    /// Check if the user already exists
    final List<Map<String, dynamic>> existingUsers = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (existingUsers.isNotEmpty) {
      return -1;

      /// Return -1 if the user already exists
    }

    return db.insert(
      'user',
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'image': iamge,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves a user from the database by email.
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await database;
    final users =
        await db.query('user', where: 'email = ?', whereArgs: [email]);
    if (users.isNotEmpty) {
      return users.first;
    }
    return null;
  }

  /// Inserts a new inventory item into the database.
  Future<int> insertInventory(String name, String image) async {
    final db = await database;
    return db.insert(
      'inventory',
      {
        'name': name,
        'image': image,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves all inventory items from the database.
  Future<List<Map<String, dynamic>>> getInventory() async {
    final db = await database;
    final inventory = await db.query('inventory');
    return inventory;
  }

  /// Deletes an inventory item from the database.
  Future<void> deleteInventory(int id) async {
    final db = await database;
    await db.delete('inventory', where: 'id = ?', whereArgs: [id]);
  }

  /// Inserts a new day into the database.
  Future<int?> insertDay(String date) async {
    final db = await database;

    /// Check if the day already exists
    final existingDay = await db.query(
      'days',
      where: 'date = ?',
      whereArgs: [date],
    );

    /// Return the id if the day already exists
    if (existingDay.isNotEmpty) {
      return existingDay.first['id'] as int?;
    }

    /// Insert the day if it doesn't exist
    return db.insert(
      'days',
      {'date': date},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  /// Inserts a new task into the database.
  Future<int?> insertTask(
    String title,
    String description,
    String date,
    String color,
    String hour,
    String image,
    String personId,
  ) async {
    final db = await database;

    /// Insert the day if it doesn't exist
    var dayId = await insertDay(date);

    /// If the day already exists, get the id
    if (dayId == 0) {
      final day = await db.query('days', where: 'date = ?', whereArgs: [date]);
      dayId = day.first['id']! as int;
    }

    /// Insert the task
    await db.insert(
      'tasks',
      {
        'title': title,
        'personId': personId,
        'description': description,
        'dayId': dayId,
        'hour': hour,
        'isCompleted': 0,
        'color': color,
        'image': image,
        'comment': '',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return dayId;
  }

  /// Retrieves all tasks for a given day from the database.
  Future<List<Map<String, dynamic>>> getTasksForDay(String date) async {
    final db = await database;
    final day = await db.query('days', where: 'date = ?', whereArgs: [date]);
    if (day.isEmpty) return [];

    final dayId = day.first['id']! as int;
    final tasks = await db.rawQuery(
      '''
    SELECT tasks.*, person.name AS personName
    FROM tasks
    LEFT JOIN person ON tasks.personId = person.id
    WHERE tasks.dayId = ?
  ''',
      [dayId],
    );

    return tasks;
  }

  /// Retrieves all tasks for the past day from the database.
  Future<List<Map<String, dynamic>>> getTasksPastDay() async {
    final db = await database;
    final now = DateTime.now();
    final dateFormat = '${now.day}-${now.month}-${now.year}';

    final days =
        await db.query('days', where: 'date < ?', whereArgs: [dateFormat]);
    if (days.isEmpty) return [];

    final dayIds = days.map((day) => day['id']! as int).toList();
    final tasks = await db.rawQuery(
      '''
    SELECT tasks.*, person.name AS personName, days.date AS taskDate
    FROM tasks
    INNER JOIN days ON tasks.dayId = days.id
    LEFT JOIN person ON tasks.personId = person.id
    WHERE tasks.dayId IN (${dayIds.join(', ')})
    ''',
    );

    return tasks;
  }

  /// Updates the completion status of a task in the database.
  Future<void> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
    String comment,
  ) async {
    final db = await database;
    await db.update(
      'tasks',
      {
        'isCompleted': isCompleted ? 1 : 0,
        'image': image,
        'comment': comment,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Updates a task in the database.
  Future<void> updateTask(int id, String title, String description) async {
    final db = await database;
    await db.update(
      'tasks',
      {'title': title, 'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Deletes a task from the database.
  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  /// Inserts a new person into the database.
  Future<void> deletePerson(int id) async {
    final db = await database;
    await db.delete('person', where: 'id = ?', whereArgs: [id]);
  }

  /// Retrieves all persons from the database.
  Future<List<Map<String, dynamic>>> getWeeklyTaskCount(
    String startDate,
    String endDate,
  ) async {
    final db = await database;

    /// Query to get the count of tasks for each day in the week
    final List<Map<String, dynamic>> tasks = await db.rawQuery(
      '''
      SELECT t.id, t.title, t.description, t.dayId,t.isCompleted, d.date, COUNT(t.id) as taskCount
      FROM tasks t
      JOIN days d ON t.dayId = d.id
      WHERE d.date = ?
      GROUP BY d.date
      ORDER BY d.date
    ''',
      [startDate],
    );

    return tasks;
  }

  /// Retrieves all persons from the database.
  Future<List<Map<String, dynamic>>> getDaysPast() async {
    /// Get the database instance
    final db = await database;
    final now = DateTime.now();
    final dateFormat = '${now.day}-${now.month}-${now.year}';

    /// Query to get all days that are not the current day
    final List<Map<String, dynamic>> days = await db.rawQuery(
      '''
    SELECT d.id,d.date
    FROM days d
    WHERE d.date != ?
    ORDER BY d.date
    ''',
      [dateFormat],

      /// Pass the current
    );

    return days;
  }

  /// Retrieves all persons from the database.
  Future<List<Map<String, dynamic>>> getPendingTaskNamesAndTimes() async {
    final db = await database;
    final now = DateTime.now();
    final dateFormat = '${now.day}-${now.month}-${now.year}';

    final List<Map<String, dynamic>> tasks = await db.rawQuery(
      '''
    SELECT t.id,t.title, t.hour
    FROM tasks t
    JOIN days d ON t.dayId = d.id
    WHERE t.isCompleted = 0 AND d.date = ?
    ORDER BY t.hour
    ''',
      [dateFormat],

      /// Pass the current
    );

    return tasks;
  }

  /// Inserts a new person into the database.
  Future<int> insertPerson(
    String name,
    int age,
    String availability,
    String image,
    String color,
  ) async {
    final db = await database;
    return db.insert(
      'person',
      {
        'name': name,
        'age': age,
        'availability': availability,
        'image': image,
        'color': color,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves a person from the database by id.
  Future<Map<String, dynamic>?> getPerson(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'person',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  /// Retrieves all persons from the database.
  Future<List<Map<String, dynamic>>> listPersons() async {
    final db = await database;
    return db.query('person');
  }

  /// Retrieves all persons from the database.
  Future<int> insertCoupon(
    String cod,
    String date,
    String discount,
    String title,
    String description,
  ) async {
    final db = await database;
    return db.insert(
      'coupon',
      {
        'cod': cod,
        'date': date,
        'discount': discount,
        'title': title,
        'description': description,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves a coupon from the database by id.
  Future<Map<String, dynamic>?> getCoupon(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'coupon',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  /// Retrieves all coupons from the database.
  Future<List<Map<String, dynamic>>> listCoupons() async {
    final db = await database;
    return db.query('coupon');
  }
}
