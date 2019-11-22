// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_hour_schedules;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltHourSchedules> _$builtHourSchedulesSerializer =
    new _$BuiltHourSchedulesSerializer();

class _$BuiltHourSchedulesSerializer
    implements StructuredSerializer<BuiltHourSchedules> {
  @override
  final Iterable<Type> types = const [BuiltHourSchedules, _$BuiltHourSchedules];
  @override
  final String wireName = 'BuiltHourSchedules';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltHourSchedules object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hour',
      serializers.serialize(object.hour, specifiedType: const FullType(int)),
    ];
    if (object.minute != null) {
      result
        ..add('minute')
        ..add(serializers.serialize(object.minute,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuiltHourSchedules deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltHourSchedulesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hour':
          result.hour = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'minute':
          result.minute = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltHourSchedules extends BuiltHourSchedules {
  @override
  final int hour;
  @override
  final int minute;

  factory _$BuiltHourSchedules(
          [void Function(BuiltHourSchedulesBuilder) updates]) =>
      (new BuiltHourSchedulesBuilder()..update(updates)).build();

  _$BuiltHourSchedules._({this.hour, this.minute}) : super._() {
    if (hour == null) {
      throw new BuiltValueNullFieldError('BuiltHourSchedules', 'hour');
    }
  }

  @override
  BuiltHourSchedules rebuild(
          void Function(BuiltHourSchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltHourSchedulesBuilder toBuilder() =>
      new BuiltHourSchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltHourSchedules &&
        hour == other.hour &&
        minute == other.minute;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, hour.hashCode), minute.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltHourSchedules')
          ..add('hour', hour)
          ..add('minute', minute))
        .toString();
  }
}

class BuiltHourSchedulesBuilder
    implements Builder<BuiltHourSchedules, BuiltHourSchedulesBuilder> {
  _$BuiltHourSchedules _$v;

  int _hour;
  int get hour => _$this._hour;
  set hour(int hour) => _$this._hour = hour;

  int _minute;
  int get minute => _$this._minute;
  set minute(int minute) => _$this._minute = minute;

  BuiltHourSchedulesBuilder();

  BuiltHourSchedulesBuilder get _$this {
    if (_$v != null) {
      _hour = _$v.hour;
      _minute = _$v.minute;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltHourSchedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltHourSchedules;
  }

  @override
  void update(void Function(BuiltHourSchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltHourSchedules build() {
    final _$result =
        _$v ?? new _$BuiltHourSchedules._(hour: hour, minute: minute);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
