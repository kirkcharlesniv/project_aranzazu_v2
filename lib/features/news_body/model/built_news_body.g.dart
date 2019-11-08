// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_news_body;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltNewsBody> _$builtNewsBodySerializer =
    new _$BuiltNewsBodySerializer();

class _$BuiltNewsBodySerializer implements StructuredSerializer<BuiltNewsBody> {
  @override
  final Iterable<Type> types = const [BuiltNewsBody, _$BuiltNewsBody];
  @override
  final String wireName = 'BuiltNewsBody';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltNewsBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'item',
      serializers.serialize(object.item, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltNewsBody deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltNewsBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltNewsBody extends BuiltNewsBody {
  @override
  final String item;

  factory _$BuiltNewsBody([void Function(BuiltNewsBodyBuilder) updates]) =>
      (new BuiltNewsBodyBuilder()..update(updates)).build();

  _$BuiltNewsBody._({this.item}) : super._() {
    if (item == null) {
      throw new BuiltValueNullFieldError('BuiltNewsBody', 'item');
    }
  }

  @override
  BuiltNewsBody rebuild(void Function(BuiltNewsBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltNewsBodyBuilder toBuilder() => new BuiltNewsBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltNewsBody && item == other.item;
  }

  @override
  int get hashCode {
    return $jf($jc(0, item.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltNewsBody')..add('item', item))
        .toString();
  }
}

class BuiltNewsBodyBuilder
    implements Builder<BuiltNewsBody, BuiltNewsBodyBuilder> {
  _$BuiltNewsBody _$v;

  String _item;
  String get item => _$this._item;
  set item(String item) => _$this._item = item;

  BuiltNewsBodyBuilder();

  BuiltNewsBodyBuilder get _$this {
    if (_$v != null) {
      _item = _$v.item;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltNewsBody other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltNewsBody;
  }

  @override
  void update(void Function(BuiltNewsBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltNewsBody build() {
    final _$result = _$v ?? new _$BuiltNewsBody._(item: item);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
