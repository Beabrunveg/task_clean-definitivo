import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/usecases/delete_person_usecase.dart';

part 'person_delete_provider.g.dart';

/// AutoDispose provider for the PersonDeleteNotifier.
@riverpod
class PersonDeleteNotifier extends _$PersonDeleteNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  /// Delete person method.
  Future<void> fetchDeletePersonData(int id) async {
    state = const AsyncValue.loading();
    final result = await sl<DeletePerson>().execute(id);
    result.match(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) {
        state = AsyncValue.data(r);
      },
    );
  }
}
