library built_weekly_schedules;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

import 'built_days.dart';

part 'built_weekly_schedules.g.dart';

abstract class BuiltWeeklySchedules
    implements Built<BuiltWeeklySchedules, BuiltWeeklySchedulesBuilder> {
  BuiltList<BuiltDays> get days;

  BuiltWeeklySchedules._();

  factory BuiltWeeklySchedules(
          [void Function(BuiltWeeklySchedulesBuilder) updates]) =
      _$BuiltWeeklySchedules;

  String toJson() {
    return json.encode(
        serializers.serializeWith(BuiltWeeklySchedules.serializer, this));
  }

  static BuiltWeeklySchedules fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltWeeklySchedules.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltWeeklySchedules> get serializer =>
      _$builtWeeklySchedulesSerializer;
}
