// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeDataImpl _$$TimeDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$TimeDataImplToJson(_$TimeDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time,
    };
