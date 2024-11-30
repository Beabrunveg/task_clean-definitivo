import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';
/// LazySingleton use case for getting all person data.
@lazySingleton
class GetAllPersonData {
  GetAllPersonData(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<PersonData>>> execute() {
    return repository.listPersons();
  }
}
