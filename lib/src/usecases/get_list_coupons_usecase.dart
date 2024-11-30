import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/repositories/database_repository.dart';
/// LazySingleton service implementation for the DatabaseService.
@lazySingleton
class GetListCoupons {
  GetListCoupons(this.repository);
  final DatabaseRepository repository;

  Future<Either<Exception, List<CouponData>>> execute() {
    return repository.listCoupons();
  }
}
