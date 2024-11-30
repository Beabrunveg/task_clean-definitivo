// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklySummary _$WeeklySummaryFromJson(Map<String, dynamic> json) {
  return _WeeklySummary.fromJson(json);
}

/// @nodoc
mixin _$WeeklySummary {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get totalTasks => throw _privateConstructorUsedError;
  List<DailyTask> get tasks => throw _privateConstructorUsedError;

  /// Serializes this WeeklySummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklySummaryCopyWith<WeeklySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklySummaryCopyWith<$Res> {
  factory $WeeklySummaryCopyWith(
          WeeklySummary value, $Res Function(WeeklySummary) then) =
      _$WeeklySummaryCopyWithImpl<$Res, WeeklySummary>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalTasks,
      List<DailyTask> tasks});
}

/// @nodoc
class _$WeeklySummaryCopyWithImpl<$Res, $Val extends WeeklySummary>
    implements $WeeklySummaryCopyWith<$Res> {
  _$WeeklySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalTasks = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalTasks: null == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<DailyTask>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklySummaryImplCopyWith<$Res>
    implements $WeeklySummaryCopyWith<$Res> {
  factory _$$WeeklySummaryImplCopyWith(
          _$WeeklySummaryImpl value, $Res Function(_$WeeklySummaryImpl) then) =
      __$$WeeklySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      int totalTasks,
      List<DailyTask> tasks});
}

/// @nodoc
class __$$WeeklySummaryImplCopyWithImpl<$Res>
    extends _$WeeklySummaryCopyWithImpl<$Res, _$WeeklySummaryImpl>
    implements _$$WeeklySummaryImplCopyWith<$Res> {
  __$$WeeklySummaryImplCopyWithImpl(
      _$WeeklySummaryImpl _value, $Res Function(_$WeeklySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? totalTasks = null,
    Object? tasks = null,
  }) {
    return _then(_$WeeklySummaryImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalTasks: null == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<DailyTask>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklySummaryImpl implements _WeeklySummary {
  const _$WeeklySummaryImpl(
      {required this.startDate,
      required this.endDate,
      required this.totalTasks,
      required final List<DailyTask> tasks})
      : _tasks = tasks;

  factory _$WeeklySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklySummaryImplFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int totalTasks;
  final List<DailyTask> _tasks;
  @override
  List<DailyTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'WeeklySummary(startDate: $startDate, endDate: $endDate, totalTasks: $totalTasks, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklySummaryImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, totalTasks,
      const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of WeeklySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklySummaryImplCopyWith<_$WeeklySummaryImpl> get copyWith =>
      __$$WeeklySummaryImplCopyWithImpl<_$WeeklySummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklySummaryImplToJson(
      this,
    );
  }
}

abstract class _WeeklySummary implements WeeklySummary {
  const factory _WeeklySummary(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final int totalTasks,
      required final List<DailyTask> tasks}) = _$WeeklySummaryImpl;

  factory _WeeklySummary.fromJson(Map<String, dynamic> json) =
      _$WeeklySummaryImpl.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get totalTasks;
  @override
  List<DailyTask> get tasks;

  /// Create a copy of WeeklySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklySummaryImplCopyWith<_$WeeklySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
