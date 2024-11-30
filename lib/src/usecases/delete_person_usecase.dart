import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';
/// DeletePerson use case
@lazySingleton
class DeletePerson {
  DeletePerson(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, void>> execute(int id) {
    return repository.deletePerson(id);
  }
}
