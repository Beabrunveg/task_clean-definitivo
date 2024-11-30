// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_pending_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskPendingNotifierHash() =>
    r'48ff0776333f7ffb9bf61e43f0d12b7059c4dfe2';

/// AutoDispose provider for the TaskPendingNotifier.
///
/// Copied from [TaskPendingNotifier].
@ProviderFor(TaskPendingNotifier)
final taskPendingNotifierProvider = AutoDisposeNotifierProvider<
    TaskPendingNotifier, AsyncValue<List<DailyTask>?>>.internal(
  TaskPendingNotifier.new,
  name: r'taskPendingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskPendingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskPendingNotifier
    = AutoDisposeNotifier<AsyncValue<List<DailyTask>?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
