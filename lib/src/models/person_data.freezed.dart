// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonData _$PersonDataFromJson(Map<String, dynamic> json) {
  return _PersonData.fromJson(json);
}

/// @nodoc
mixin _$PersonData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get availability => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this PersonData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonDataCopyWith<PersonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDataCopyWith<$Res> {
  factory $PersonDataCopyWith(
          PersonData value, $Res Function(PersonData) then) =
      _$PersonDataCopyWithImpl<$Res, PersonData>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? availability,
      int? age,
      String? image,
      String? color});
}

/// @nodoc
class _$PersonDataCopyWithImpl<$Res, $Val extends PersonData>
    implements $PersonDataCopyWith<$Res> {
  _$PersonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? availability = freezed,
    Object? age = freezed,
    Object? image = freezed,
    Object? color = freezed,
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
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonDataImplCopyWith<$Res>
    implements $PersonDataCopyWith<$Res> {
  factory _$$PersonDataImplCopyWith(
          _$PersonDataImpl value, $Res Function(_$PersonDataImpl) then) =
      __$$PersonDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? availability,
      int? age,
      String? image,
      String? color});
}

/// @nodoc
class __$$PersonDataImplCopyWithImpl<$Res>
    extends _$PersonDataCopyWithImpl<$Res, _$PersonDataImpl>
    implements _$$PersonDataImplCopyWith<$Res> {
  __$$PersonDataImplCopyWithImpl(
      _$PersonDataImpl _value, $Res Function(_$PersonDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? availability = freezed,
    Object? age = freezed,
    Object? image = freezed,
    Object? color = freezed,
  }) {
    return _then(_$PersonDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonDataImpl implements _PersonData {
  const _$PersonDataImpl(
      {this.id,
      this.name,
      this.availability,
      this.age,
      this.image,
      this.color});

  factory _$PersonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? availability;
  @override
  final int? age;
  @override
  final String? image;
  @override
  final String? color;

  @override
  String toString() {
    return 'PersonData(id: $id, name: $name, availability: $availability, age: $age, image: $image, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, availability, age, image, color);

  /// Create a copy of PersonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonDataImplCopyWith<_$PersonDataImpl> get copyWith =>
      __$$PersonDataImplCopyWithImpl<_$PersonDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonDataImplToJson(
      this,
    );
  }
}

abstract class _PersonData implements PersonData {
  const factory _PersonData(
      {final int? id,
      final String? name,
      final String? availability,
      final int? age,
      final String? image,
      final String? color}) = _$PersonDataImpl;

  factory _PersonData.fromJson(Map<String, dynamic> json) =
      _$PersonDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get availability;
  @override
  int? get age;
  @override
  String? get image;
  @override
  String? get color;

  /// Create a copy of PersonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonDataImplCopyWith<_$PersonDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
