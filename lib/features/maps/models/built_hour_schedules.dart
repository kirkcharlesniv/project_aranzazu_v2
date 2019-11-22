library built_hour_schedules;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

part 'built_hour_schedules.g.dart';

abstract class BuiltHourSchedules
    implements Built<BuiltHourSchedules, BuiltHourSchedulesBuilder> {
  int get hour;
  @nullable
  int get minute;

  BuiltHourSchedules._();

  factory BuiltHourSchedules(
          [void Function(BuiltHourSchedulesBuilder) updates]) =
      _$BuiltHourSchedules;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltHourSchedules.serializer, this));
  }

  static BuiltHourSchedules fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltHourSchedules.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltHourSchedules> get serializer =>
      _$builtHourSchedulesSerializer;
}
