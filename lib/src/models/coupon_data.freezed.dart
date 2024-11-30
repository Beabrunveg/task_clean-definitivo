// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CouponData _$CouponDataFromJson(Map<String, dynamic> json) {
  return _CouponData.fromJson(json);
}

/// @nodoc
mixin _$CouponData {
  int? get id => throw _privateConstructorUsedError;
  String? get cod => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get discount => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CouponData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CouponData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CouponDataCopyWith<CouponData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDataCopyWith<$Res> {
  factory $CouponDataCopyWith(
          CouponData value, $Res Function(CouponData) then) =
      _$CouponDataCopyWithImpl<$Res, CouponData>;
  @useResult
  $Res call(
      {int? id,
      String? cod,
      String? date,
      String? discount,
      String? title,
      String? description});
}

/// @nodoc
class _$CouponDataCopyWithImpl<$Res, $Val extends CouponData>
    implements $CouponDataCopyWith<$Res> {
  _$CouponDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CouponData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cod = freezed,
    Object? date = freezed,
    Object? discount = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponDataImplCopyWith<$Res>
    implements $CouponDataCopyWith<$Res> {
  factory _$$CouponDataImplCopyWith(
          _$CouponDataImpl value, $Res Function(_$CouponDataImpl) then) =
      __$$CouponDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? cod,
      String? date,
      String? discount,
      String? title,
      String? description});
}

/// @nodoc
class __$$CouponDataImplCopyWithImpl<$Res>
    extends _$CouponDataCopyWithImpl<$Res, _$CouponDataImpl>
    implements _$$CouponDataImplCopyWith<$Res> {
  __$$CouponDataImplCopyWithImpl(
      _$CouponDataImpl _value, $Res Function(_$CouponDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CouponData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cod = freezed,
    Object? date = freezed,
    Object? discount = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CouponDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponDataImpl implements _CouponData {
  const _$CouponDataImpl(
      {this.id,
      this.cod,
      this.date,
      this.discount,
      this.title,
      this.description});

  factory _$CouponDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? cod;
  @override
  final String? date;
  @override
  final String? discount;
  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString() {
    return 'CouponData(id: $id, cod: $cod, date: $date, discount: $discount, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cod, cod) || other.cod == cod) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, cod, date, discount, title, description);

  /// Create a copy of CouponData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponDataImplCopyWith<_$CouponDataImpl> get copyWith =>
      __$$CouponDataImplCopyWithImpl<_$CouponDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponDataImplToJson(
      this,
    );
  }
}

abstract class _CouponData implements CouponData {
  const factory _CouponData(
      {final int? id,
      final String? cod,
      final String? date,
      final String? discount,
      final String? title,
      final String? description}) = _$CouponDataImpl;

  factory _CouponData.fromJson(Map<String, dynamic> json) =
      _$CouponDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get cod;
  @override
  String? get date;
  @override
  String? get discount;
  @override
  String? get title;
  @override
  String? get description;

  /// Create a copy of CouponData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponDataImplCopyWith<_$CouponDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
