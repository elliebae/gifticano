// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifticanos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GifticanosRecord> _$gifticanosRecordSerializer =
    new _$GifticanosRecordSerializer();

class _$GifticanosRecordSerializer
    implements StructuredSerializer<GifticanosRecord> {
  @override
  final Iterable<Type> types = const [GifticanosRecord, _$GifticanosRecord];
  @override
  final String wireName = 'GifticanosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, GifticanosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.used;
    if (value != null) {
      result
        ..add('used')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.validDate;
    if (value != null) {
      result
        ..add('validDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.barcodeImageUrl;
    if (value != null) {
      result
        ..add('barcodeImageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullImageURL;
    if (value != null) {
      result
        ..add('fullImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.usedAt;
    if (value != null) {
      result
        ..add('usedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gifticonId;
    if (value != null) {
      result
        ..add('gifticonId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  GifticanosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GifticanosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'validDate':
          result.validDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'barcodeImageUrl':
          result.barcodeImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fullImageURL':
          result.fullImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'usedAt':
          result.usedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gifticonId':
          result.gifticonId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$GifticanosRecord extends GifticanosRecord {
  @override
  final bool used;
  @override
  final String validDate;
  @override
  final String barcodeImageUrl;
  @override
  final String fullImageURL;
  @override
  final DateTime usedAt;
  @override
  final String userId;
  @override
  final String gifticonId;
  @override
  final String version;
  @override
  final DocumentReference<Object> reference;

  factory _$GifticanosRecord(
          [void Function(GifticanosRecordBuilder) updates]) =>
      (new GifticanosRecordBuilder()..update(updates)).build();

  _$GifticanosRecord._(
      {this.used,
      this.validDate,
      this.barcodeImageUrl,
      this.fullImageURL,
      this.usedAt,
      this.userId,
      this.gifticonId,
      this.version,
      this.reference})
      : super._();

  @override
  GifticanosRecord rebuild(void Function(GifticanosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GifticanosRecordBuilder toBuilder() =>
      new GifticanosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GifticanosRecord &&
        used == other.used &&
        validDate == other.validDate &&
        barcodeImageUrl == other.barcodeImageUrl &&
        fullImageURL == other.fullImageURL &&
        usedAt == other.usedAt &&
        userId == other.userId &&
        gifticonId == other.gifticonId &&
        version == other.version &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, used.hashCode), validDate.hashCode),
                                barcodeImageUrl.hashCode),
                            fullImageURL.hashCode),
                        usedAt.hashCode),
                    userId.hashCode),
                gifticonId.hashCode),
            version.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GifticanosRecord')
          ..add('used', used)
          ..add('validDate', validDate)
          ..add('barcodeImageUrl', barcodeImageUrl)
          ..add('fullImageURL', fullImageURL)
          ..add('usedAt', usedAt)
          ..add('userId', userId)
          ..add('gifticonId', gifticonId)
          ..add('version', version)
          ..add('reference', reference))
        .toString();
  }
}

class GifticanosRecordBuilder
    implements Builder<GifticanosRecord, GifticanosRecordBuilder> {
  _$GifticanosRecord _$v;

  bool _used;
  bool get used => _$this._used;
  set used(bool used) => _$this._used = used;

  String _validDate;
  String get validDate => _$this._validDate;
  set validDate(String validDate) => _$this._validDate = validDate;

  String _barcodeImageUrl;
  String get barcodeImageUrl => _$this._barcodeImageUrl;
  set barcodeImageUrl(String barcodeImageUrl) =>
      _$this._barcodeImageUrl = barcodeImageUrl;

  String _fullImageURL;
  String get fullImageURL => _$this._fullImageURL;
  set fullImageURL(String fullImageURL) => _$this._fullImageURL = fullImageURL;

  DateTime _usedAt;
  DateTime get usedAt => _$this._usedAt;
  set usedAt(DateTime usedAt) => _$this._usedAt = usedAt;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _gifticonId;
  String get gifticonId => _$this._gifticonId;
  set gifticonId(String gifticonId) => _$this._gifticonId = gifticonId;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  GifticanosRecordBuilder() {
    GifticanosRecord._initializeBuilder(this);
  }

  GifticanosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _used = $v.used;
      _validDate = $v.validDate;
      _barcodeImageUrl = $v.barcodeImageUrl;
      _fullImageURL = $v.fullImageURL;
      _usedAt = $v.usedAt;
      _userId = $v.userId;
      _gifticonId = $v.gifticonId;
      _version = $v.version;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GifticanosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GifticanosRecord;
  }

  @override
  void update(void Function(GifticanosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GifticanosRecord build() {
    final _$result = _$v ??
        new _$GifticanosRecord._(
            used: used,
            validDate: validDate,
            barcodeImageUrl: barcodeImageUrl,
            fullImageURL: fullImageURL,
            usedAt: usedAt,
            userId: userId,
            gifticonId: gifticonId,
            version: version,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
