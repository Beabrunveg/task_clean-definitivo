// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyTaskImpl _$$DailyTaskImplFromJson(Map<String, dynamic> json) =>
    _$DailyTaskImpl(
      id: (json['id'] as num).toInt(),
      personId: (json['personId'] as num).toInt(),
      taskName: json['taskName'] as String,
      taskDescription: json['taskDescription'] as String,
      date: json['date'] as String,
      hour: json['hour'] as String,
      isCompleted: json['isCompleted'] as bool,
      color: json['color'] as String,
      comment: json['comment'] as String,
      personName: json['personName'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$DailyTaskImplToJson(_$DailyTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'personId': instance.personId,
      'taskName': instance.taskName,
      'taskDescription': instance.taskDescription,
      'date': instance.date,
      'hour': instance.hour,
      'isCompleted': instance.isCompleted,
      'color': instance.color,
      'comment': instance.comment,
      'personName': instance.personName,
      'image': instance.image,
    };
