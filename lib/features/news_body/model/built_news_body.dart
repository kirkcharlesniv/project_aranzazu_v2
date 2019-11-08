library built_news_body;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

part 'built_news_body.g.dart';

abstract class BuiltNewsBody
    implements Built<BuiltNewsBody, BuiltNewsBodyBuilder> {
  String get item;

  BuiltNewsBody._();

  factory BuiltNewsBody([void Function(BuiltNewsBodyBuilder) updates]) =
      _$BuiltNewsBody;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltNewsBody.serializer, this));
  }

  static BuiltNewsBody fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltNewsBody.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltNewsBody> get serializer => _$builtNewsBodySerializer;
}
