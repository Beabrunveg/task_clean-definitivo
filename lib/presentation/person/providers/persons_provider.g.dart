// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persons_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$personPersonsNotifierHash() =>
    r'5826143d32b75578f25e530200d3a2cff3e4fb61';

/// AutoDispose provider for the PersonPersonsNotifier.
///
/// Copied from [PersonPersonsNotifier].
@ProviderFor(PersonPersonsNotifier)
final personPersonsNotifierProvider = AutoDisposeNotifierProvider<
    PersonPersonsNotifier, AsyncValue<List<PersonData>?>>.internal(
  PersonPersonsNotifier.new,
  name: r'personPersonsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$personPersonsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PersonPersonsNotifier
    = AutoDisposeNotifier<AsyncValue<List<PersonData>?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
