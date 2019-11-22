// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_days;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltDays> _$builtDaysSerializer = new _$BuiltDaysSerializer();

class _$BuiltDaysSerializer implements StructuredSerializer<BuiltDays> {
  @override
  final Iterable<Type> types = const [BuiltDays, _$BuiltDays];
  @override
  final String wireName = 'BuiltDays';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltDays object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'day',
      serializers.serialize(object.day, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'special',
      serializers.serialize(object.special,
          specifiedType: const FullType(bool)),
      'hour_schedules',
      serializers.serialize(object.hour_schedules,
          specifiedType: const FullType(
              BuiltList, const [const FullType(BuiltHourSchedules)])),
    ];

    return result;
  }

  @override
  BuiltDays deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltDaysBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'special':
          result.special = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hour_schedules':
          result.hour_schedules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BuiltHourSchedules)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltDays extends BuiltDays {
  @override
  final int day;
  @override
  final String title;
  @override
  final bool special;
  @override
  final BuiltList<BuiltHourSchedules> hour_schedules;

  factory _$BuiltDays([void Function(BuiltDaysBuilder) updates]) =>
      (new BuiltDaysBuilder()..update(updates)).build();

  _$BuiltDays._({this.day, this.title, this.special, this.hour_schedules})
      : super._() {
    if (day == null) {
      throw new BuiltValueNullFieldError('BuiltDays', 'day');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('BuiltDays', 'title');
    }
    if (special == null) {
      throw new BuiltValueNullFieldError('BuiltDays', 'special');
    }
    if (hour_schedules == null) {
      throw new BuiltValueNullFieldError('BuiltDays', 'hour_schedules');
    }
  }

  @override
  BuiltDays rebuild(void Function(BuiltDaysBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltDaysBuilder toBuilder() => new BuiltDaysBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltDays &&
        day == other.day &&
        title == other.title &&
        special == other.special &&
        hour_schedules == other.hour_schedules;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, day.hashCode), title.hashCode), special.hashCode),
        hour_schedules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltDays')
          ..add('day', day)
          ..add('title', title)
          ..add('special', special)
          ..add('hour_schedules', hour_schedules))
        .toString();
  }
}

class BuiltDaysBuilder implements Builder<BuiltDays, BuiltDaysBuilder> {
  _$BuiltDays _$v;

  int _day;
  int get day => _$this._day;
  set day(int day) => _$this._day = day;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _special;
  bool get special => _$this._special;
  set special(bool special) => _$this._special = special;

  ListBuilder<BuiltHourSchedules> _hour_schedules;
  ListBuilder<BuiltHourSchedules> get hour_schedules =>
      _$this._hour_schedules ??= new ListBuilder<BuiltHourSchedules>();
  set hour_schedules(ListBuilder<BuiltHourSchedules> hour_schedules) =>
      _$this._hour_schedules = hour_schedules;

  BuiltDaysBuilder();

  BuiltDaysBuilder get _$this {
    if (_$v != null) {
      _day = _$v.day;
      _title = _$v.title;
      _special = _$v.special;
      _hour_schedules = _$v.hour_schedules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltDays other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltDays;
  }

  @override
  void update(void Function(BuiltDaysBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltDays build() {
    _$BuiltDays _$result;
    try {
      _$result = _$v ??
          new _$BuiltDays._(
              day: day,
              title: title,
              special: special,
              hour_schedules: hour_schedules.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hour_schedules';
        hour_schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltDays', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
