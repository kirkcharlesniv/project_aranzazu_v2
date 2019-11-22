library built_days;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

import 'built_hour_schedules.dart';

part 'built_days.g.dart';

abstract class BuiltDays implements Built<BuiltDays, BuiltDaysBuilder> {
  int get day;
  String get title;
  bool get special;
  BuiltList<BuiltHourSchedules> get hour_schedules;

  BuiltDays._();

  factory BuiltDays([void Function(BuiltDaysBuilder) updates]) = _$BuiltDays;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltDays.serializer, this));
  }

  static BuiltDays fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltDays.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltDays> get serializer => _$builtDaysSerializer;
}
