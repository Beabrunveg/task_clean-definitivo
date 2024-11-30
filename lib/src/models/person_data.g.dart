// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonDataImpl _$$PersonDataImplFromJson(Map<String, dynamic> json) =>
    _$PersonDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      availability: json['availability'] as String?,
      age: (json['age'] as num?)?.toInt(),
      image: json['image'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$PersonDataImplToJson(_$PersonDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'availability': instance.availability,
      'age': instance.age,
      'image': instance.image,
      'color': instance.color,
    };
