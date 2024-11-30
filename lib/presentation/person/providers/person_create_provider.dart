import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/insert_person_data_usecase.dart';

part 'person_create_provider.g.dart';

/// AutoDispose provider for the PersonCreateNotifier.
@riverpod
class PersonCreateNotifier extends _$PersonCreateNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  /// Register person method.
  Future<void> fetchCreatePersonData(PersonData personData) async {
    state = const AsyncValue.loading();
    final result = await sl<InsertPersonData>().execute(personData);
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
