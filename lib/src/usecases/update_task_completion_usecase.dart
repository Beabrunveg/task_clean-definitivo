import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';
/// LazySingleton service implementation for the DatabaseService.
@lazySingleton
class UpdateTaskCompletion {
  UpdateTaskCompletion(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, void>> execute(
    int id,
    bool isCompleted,
    String image,
    String comment,
  ) {
    return repository.updateTaskCompletion(id, isCompleted, image, comment);
  }
}
