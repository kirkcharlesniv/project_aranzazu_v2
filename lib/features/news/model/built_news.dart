library built_news;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:project_aranzazu_v2/core/serializers.dart';

part 'built_news.g.dart';

abstract class BuiltNews implements Built<BuiltNews, BuiltNewsBuilder> {
  int get id;
  String get date;
  String get title;
  String get excerpt;
  String get authorName;
  String get authorImage;
  String get thumbnail;

  BuiltNews._();

  factory BuiltNews([void Function(BuiltNewsBuilder) updates]) = _$BuiltNews;

  String toJson() {
    return json.encode(serializers.serializeWith(BuiltNews.serializer, this));
  }

  static BuiltNews fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltNews.serializer, json.decode(jsonString));
  }

  static Serializer<BuiltNews> get serializer => _$builtNewsSerializer;
}
