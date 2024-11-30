// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponDataImpl _$$CouponDataImplFromJson(Map<String, dynamic> json) =>
    _$CouponDataImpl(
      id: (json['id'] as num?)?.toInt(),
      cod: json['cod'] as String?,
      date: json['date'] as String?,
      discount: json['discount'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CouponDataImplToJson(_$CouponDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cod': instance.cod,
      'date': instance.date,
      'discount': instance.discount,
      'title': instance.title,
      'description': instance.description,
    };
