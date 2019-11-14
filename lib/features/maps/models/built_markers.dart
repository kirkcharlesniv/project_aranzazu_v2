library built_markers;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

part 'built_markers.g.dart';

abstract class BuiltMarkers
    implements Built<BuiltMarkers, BuiltMarkersBuilder> {
  String get coordinator;
  String get msk;
  String get location;
  double get lat;
  double get long;
  double get zoom;

  BuiltMarkers._();

  factory BuiltMarkers([void Function(BuiltMarkersBuilder) updates]) =
      _$BuiltMarkers;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltMarkers.serializer, this));
  }

  static BuiltMarkers fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltMarkers.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltMarkers> get serializer => _$builtMarkersSerializer;
}
