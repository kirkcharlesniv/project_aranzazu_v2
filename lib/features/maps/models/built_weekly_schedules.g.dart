// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_weekly_schedules;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltWeeklySchedules> _$builtWeeklySchedulesSerializer =
    new _$BuiltWeeklySchedulesSerializer();

class _$BuiltWeeklySchedulesSerializer
    implements StructuredSerializer<BuiltWeeklySchedules> {
  @override
  final Iterable<Type> types = const [
    BuiltWeeklySchedules,
    _$BuiltWeeklySchedules
  ];
  @override
  final String wireName = 'BuiltWeeklySchedules';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BuiltWeeklySchedules object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'days',
      serializers.serialize(object.days,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BuiltDays)])),
    ];

    return result;
  }

  @override
  BuiltWeeklySchedules deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltWeeklySchedulesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'days':
          result.days.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BuiltDays)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltWeeklySchedules extends BuiltWeeklySchedules {
  @override
  final BuiltList<BuiltDays> days;

  factory _$BuiltWeeklySchedules(
          [void Function(BuiltWeeklySchedulesBuilder) updates]) =>
      (new BuiltWeeklySchedulesBuilder()..update(updates)).build();

  _$BuiltWeeklySchedules._({this.days}) : super._() {
    if (days == null) {
      throw new BuiltValueNullFieldError('BuiltWeeklySchedules', 'days');
    }
  }

  @override
  BuiltWeeklySchedules rebuild(
          void Function(BuiltWeeklySchedulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltWeeklySchedulesBuilder toBuilder() =>
      new BuiltWeeklySchedulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltWeeklySchedules && days == other.days;
  }

  @override
  int get hashCode {
    return $jf($jc(0, days.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltWeeklySchedules')
          ..add('days', days))
        .toString();
  }
}

class BuiltWeeklySchedulesBuilder
    implements Builder<BuiltWeeklySchedules, BuiltWeeklySchedulesBuilder> {
  _$BuiltWeeklySchedules _$v;

  ListBuilder<BuiltDays> _days;
  ListBuilder<BuiltDays> get days =>
      _$this._days ??= new ListBuilder<BuiltDays>();
  set days(ListBuilder<BuiltDays> days) => _$this._days = days;

  BuiltWeeklySchedulesBuilder();

  BuiltWeeklySchedulesBuilder get _$this {
    if (_$v != null) {
      _days = _$v.days?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltWeeklySchedules other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltWeeklySchedules;
  }

  @override
  void update(void Function(BuiltWeeklySchedulesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltWeeklySchedules build() {
    _$BuiltWeeklySchedules _$result;
    try {
      _$result = _$v ?? new _$BuiltWeeklySchedules._(days: days.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'days';
        days.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltWeeklySchedules', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
