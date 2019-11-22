// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_markers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltMarkers> _$builtMarkersSerializer =
    new _$BuiltMarkersSerializer();

class _$BuiltMarkersSerializer implements StructuredSerializer<BuiltMarkers> {
  @override
  final Iterable<Type> types = const [BuiltMarkers, _$BuiltMarkers];
  @override
  final String wireName = 'BuiltMarkers';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltMarkers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'coordinator',
      serializers.serialize(object.coordinator,
          specifiedType: const FullType(String)),
      'msk',
      serializers.serialize(object.msk, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(double)),
      'long',
      serializers.serialize(object.long, specifiedType: const FullType(double)),
      'zoom',
      serializers.serialize(object.zoom, specifiedType: const FullType(double)),
      'weekly_schedules',
      serializers.serialize(object.weekly_schedules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BuiltDays)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.imageUrl != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(object.imageUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuiltMarkers deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltMarkersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'coordinator':
          result.coordinator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msk':
          result.msk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'long':
          result.long = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'zoom':
          result.zoom = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'weekly_schedules':
          result.weekly_schedules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BuiltDays)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltMarkers extends BuiltMarkers {
  @override
  final String coordinator;
  @override
  final String msk;
  @override
  final String location;
  @override
  final double lat;
  @override
  final double long;
  @override
  final double zoom;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final BuiltList<BuiltDays> weekly_schedules;

  factory _$BuiltMarkers([void Function(BuiltMarkersBuilder) updates]) =>
      (new BuiltMarkersBuilder()..update(updates)).build();

  _$BuiltMarkers._(
      {this.coordinator,
      this.msk,
      this.location,
      this.lat,
      this.long,
      this.zoom,
      this.description,
      this.imageUrl,
      this.weekly_schedules})
      : super._() {
    if (coordinator == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'coordinator');
    }
    if (msk == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'msk');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'location');
    }
    if (lat == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'lat');
    }
    if (long == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'long');
    }
    if (zoom == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'zoom');
    }
    if (weekly_schedules == null) {
      throw new BuiltValueNullFieldError('BuiltMarkers', 'weekly_schedules');
    }
  }

  @override
  BuiltMarkers rebuild(void Function(BuiltMarkersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltMarkersBuilder toBuilder() => new BuiltMarkersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltMarkers &&
        coordinator == other.coordinator &&
        msk == other.msk &&
        location == other.location &&
        lat == other.lat &&
        long == other.long &&
        zoom == other.zoom &&
        description == other.description &&
        imageUrl == other.imageUrl &&
        weekly_schedules == other.weekly_schedules;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, coordinator.hashCode), msk.hashCode),
                                location.hashCode),
                            lat.hashCode),
                        long.hashCode),
                    zoom.hashCode),
                description.hashCode),
            imageUrl.hashCode),
        weekly_schedules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltMarkers')
          ..add('coordinator', coordinator)
          ..add('msk', msk)
          ..add('location', location)
          ..add('lat', lat)
          ..add('long', long)
          ..add('zoom', zoom)
          ..add('description', description)
          ..add('imageUrl', imageUrl)
          ..add('weekly_schedules', weekly_schedules))
        .toString();
  }
}

class BuiltMarkersBuilder
    implements Builder<BuiltMarkers, BuiltMarkersBuilder> {
  _$BuiltMarkers _$v;

  String _coordinator;
  String get coordinator => _$this._coordinator;
  set coordinator(String coordinator) => _$this._coordinator = coordinator;

  String _msk;
  String get msk => _$this._msk;
  set msk(String msk) => _$this._msk = msk;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  double _lat;
  double get lat => _$this._lat;
  set lat(double lat) => _$this._lat = lat;

  double _long;
  double get long => _$this._long;
  set long(double long) => _$this._long = long;

  double _zoom;
  double get zoom => _$this._zoom;
  set zoom(double zoom) => _$this._zoom = zoom;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<BuiltDays> _weekly_schedules;
  ListBuilder<BuiltDays> get weekly_schedules =>
      _$this._weekly_schedules ??= new ListBuilder<BuiltDays>();
  set weekly_schedules(ListBuilder<BuiltDays> weekly_schedules) =>
      _$this._weekly_schedules = weekly_schedules;

  BuiltMarkersBuilder();

  BuiltMarkersBuilder get _$this {
    if (_$v != null) {
      _coordinator = _$v.coordinator;
      _msk = _$v.msk;
      _location = _$v.location;
      _lat = _$v.lat;
      _long = _$v.long;
      _zoom = _$v.zoom;
      _description = _$v.description;
      _imageUrl = _$v.imageUrl;
      _weekly_schedules = _$v.weekly_schedules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltMarkers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltMarkers;
  }

  @override
  void update(void Function(BuiltMarkersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltMarkers build() {
    _$BuiltMarkers _$result;
    try {
      _$result = _$v ??
          new _$BuiltMarkers._(
              coordinator: coordinator,
              msk: msk,
              location: location,
              lat: lat,
              long: long,
              zoom: zoom,
              description: description,
              imageUrl: imageUrl,
              weekly_schedules: weekly_schedules.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'weekly_schedules';
        weekly_schedules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltMarkers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
