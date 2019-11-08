// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_events;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltEvents> _$builtEventsSerializer = new _$BuiltEventsSerializer();

class _$BuiltEventsSerializer implements StructuredSerializer<BuiltEvents> {
  @override
  final Iterable<Type> types = const [BuiltEvents, _$BuiltEvents];
  @override
  final String wireName = 'BuiltEvents';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltEvents object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'event',
      serializers.serialize(object.event,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltEvents deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltEventsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltEvents extends BuiltEvents {
  @override
  final String date;
  @override
  final String event;
  @override
  final String image;
  @override
  final String description;

  factory _$BuiltEvents([void Function(BuiltEventsBuilder) updates]) =>
      (new BuiltEventsBuilder()..update(updates)).build();

  _$BuiltEvents._({this.date, this.event, this.image, this.description})
      : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('BuiltEvents', 'date');
    }
    if (event == null) {
      throw new BuiltValueNullFieldError('BuiltEvents', 'event');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('BuiltEvents', 'image');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('BuiltEvents', 'description');
    }
  }

  @override
  BuiltEvents rebuild(void Function(BuiltEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltEventsBuilder toBuilder() => new BuiltEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltEvents &&
        date == other.date &&
        event == other.event &&
        image == other.image &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, date.hashCode), event.hashCode), image.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltEvents')
          ..add('date', date)
          ..add('event', event)
          ..add('image', image)
          ..add('description', description))
        .toString();
  }
}

class BuiltEventsBuilder implements Builder<BuiltEvents, BuiltEventsBuilder> {
  _$BuiltEvents _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _event;
  String get event => _$this._event;
  set event(String event) => _$this._event = event;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  BuiltEventsBuilder();

  BuiltEventsBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _event = _$v.event;
      _image = _$v.image;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltEvents other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltEvents;
  }

  @override
  void update(void Function(BuiltEventsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltEvents build() {
    final _$result = _$v ??
        new _$BuiltEvents._(
            date: date, event: event, image: image, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
