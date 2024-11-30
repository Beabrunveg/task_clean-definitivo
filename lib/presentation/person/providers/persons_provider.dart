import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/get_all_person_data_usecase.dart';

part 'persons_provider.g.dart';

/// AutoDispose provider for the PersonPersonsNotifier.
@riverpod
class PersonPersonsNotifier extends _$PersonPersonsNotifier {
  List<PersonData>? _originalPersons;
  @override
  AsyncValue<List<PersonData>?> build() {
    fetchGetAllPersons();
    return const AsyncValue.loading();
  }

  /// Get all persons method.
  Future<void> fetchGetAllPersons() async {
    state = const AsyncValue.loading();
    try {
      final result = await sl<GetAllPersonData>().execute();
      result.match(
        (l) {
          state = AsyncValue.error(l, StackTrace.current);
        },
        (r) {
          _originalPersons = r;
          state = AsyncValue.data(r);
        },
      );
    } catch (e) {
      log('Error: $e');
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Search person method.
  void searchPerson(String text) {
    if (text.isEmpty) {
      state = AsyncValue.data(_originalPersons);
      return;
    }
    final persons = _originalPersons ?? [];
    final filterPersons = persons.where((e) => e.name!.contains(text)).toList();
    state = AsyncValue.data(filterPersons);
  }
}
