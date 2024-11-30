// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeData _$TimeDataFromJson(Map<String, dynamic> json) {
  return _TimeData.fromJson(json);
}

/// @nodoc
mixin _$TimeData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;

  /// Serializes this TimeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeDataCopyWith<TimeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeDataCopyWith<$Res> {
  factory $TimeDataCopyWith(TimeData value, $Res Function(TimeData) then) =
      _$TimeDataCopyWithImpl<$Res, TimeData>;
  @useResult
  $Res call({int? id, String? name, String? time});
}

/// @nodoc
class _$TimeDataCopyWithImpl<$Res, $Val extends TimeData>
    implements $TimeDataCopyWith<$Res> {
  _$TimeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeDataImplCopyWith<$Res>
    implements $TimeDataCopyWith<$Res> {
  factory _$$TimeDataImplCopyWith(
          _$TimeDataImpl value, $Res Function(_$TimeDataImpl) then) =
      __$$TimeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? time});
}

/// @nodoc
class __$$TimeDataImplCopyWithImpl<$Res>
    extends _$TimeDataCopyWithImpl<$Res, _$TimeDataImpl>
    implements _$$TimeDataImplCopyWith<$Res> {
  __$$TimeDataImplCopyWithImpl(
      _$TimeDataImpl _value, $Res Function(_$TimeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
  }) {
    return _then(_$TimeDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeDataImpl implements _TimeData {
  const _$TimeDataImpl({this.id, this.name, this.time});

  factory _$TimeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? time;

  @override
  String toString() {
    return 'TimeData(id: $id, name: $name, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, time);

  /// Create a copy of TimeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeDataImplCopyWith<_$TimeDataImpl> get copyWith =>
      __$$TimeDataImplCopyWithImpl<_$TimeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeDataImplToJson(
      this,
    );
  }
}

abstract class _TimeData implements TimeData {
  const factory _TimeData(
      {final int? id, final String? name, final String? time}) = _$TimeDataImpl;

  factory _TimeData.fromJson(Map<String, dynamic> json) =
      _$TimeDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get time;

  /// Create a copy of TimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeDataImplCopyWith<_$TimeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
