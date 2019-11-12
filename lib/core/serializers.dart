library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:project_aranzazu_v2/features/events/model/built_events.dart';
import 'package:project_aranzazu_v2/features/maps/models/built_markers.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';
import 'package:project_aranzazu_v2/features/news_body/model/built_news_body.dart';

part 'serializers.g.dart';

@SerializersFor([BuiltNews, BuiltNewsBody, BuiltEvents, BuiltMarkers])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
