// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_completed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskCompletedNotifierHash() =>
    r'7bcbe4565e6b82bcbb1d3053518a1dd9427008dd';

/// AutoDispose provider for the TaskCompletedNotifier.
///
/// Copied from [TaskCompletedNotifier].
@ProviderFor(TaskCompletedNotifier)
final taskCompletedNotifierProvider = AutoDisposeNotifierProvider<
    TaskCompletedNotifier, AsyncValue<List<DailyTask>?>>.internal(
  TaskCompletedNotifier.new,
  name: r'taskCompletedNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskCompletedNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskCompletedNotifier
    = AutoDisposeNotifier<AsyncValue<List<DailyTask>?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
