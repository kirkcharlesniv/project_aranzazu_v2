library built_events;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

part 'built_events.g.dart';

abstract class BuiltEvents implements Built<BuiltEvents, BuiltEventsBuilder> {
  String get date;
  String get event;
  String get image;
  String get description;

  BuiltEvents._();

  factory BuiltEvents([void Function(BuiltEventsBuilder) updates]) =
      _$BuiltEvents;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltEvents.serializer, this));
  }

  static BuiltEvents fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltEvents.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltEvents> get serializer => _$builtEventsSerializer;
}
