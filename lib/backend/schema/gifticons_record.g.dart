// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifticons_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GifticonsRecord> _$gifticonsRecordSerializer =
    new _$GifticonsRecordSerializer();

class _$GifticonsRecordSerializer
    implements StructuredSerializer<GifticonsRecord> {
  @override
  final Iterable<Type> types = const [GifticonsRecord, _$GifticonsRecord];
  @override
  final String wireName = 'GifticonsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, GifticonsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.failReason;
    if (value != null) {
      result
        ..add('failReason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uploadedAt;
    if (value != null) {
      result
        ..add('uploadedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.imageURL;
    if (value != null) {
      result
        ..add('imageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.barcodeNumber;
    if (value != null) {
      result
        ..add('barcodeNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellingStatus;
    if (value != null) {
      result
        ..add('selling_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.resellPrice;
    if (value != null) {
      result
        ..add('resell_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.refund;
    if (value != null) {
      result
        ..add('refund')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasProblem;
    if (value != null) {
      result
        ..add('hasProblem')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  GifticonsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GifticonsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'failReason':
          result.failReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uploadedAt':
          result.uploadedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'barcodeNumber':
          result.barcodeNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selling_status':
          result.sellingStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'resell_price':
          result.resellPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'refund':
          result.refund = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasProblem':
          result.hasProblem = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$GifticonsRecord extends GifticonsRecord {
  @override
  final DocumentReference<Object> userId;
  @override
  final String status;
  @override
  final int price;
  @override
  final String failReason;
  @override
  final DateTime uploadedAt;
  @override
  final String imageURL;
  @override
  final String barcodeNumber;
  @override
  final String sellingStatus;
  @override
  final int resellPrice;
  @override
  final bool refund;
  @override
  final bool hasProblem;
  @override
  final String version;
  @override
  final DocumentReference<Object> reference;

  factory _$GifticonsRecord([void Function(GifticonsRecordBuilder) updates]) =>
      (new GifticonsRecordBuilder()..update(updates)).build();

  _$GifticonsRecord._(
      {this.userId,
      this.status,
      this.price,
      this.failReason,
      this.uploadedAt,
      this.imageURL,
      this.barcodeNumber,
      this.sellingStatus,
      this.resellPrice,
      this.refund,
      this.hasProblem,
      this.version,
      this.reference})
      : super._();

  @override
  GifticonsRecord rebuild(void Function(GifticonsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GifticonsRecordBuilder toBuilder() =>
      new GifticonsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GifticonsRecord &&
        userId == other.userId &&
        status == other.status &&
        price == other.price &&
        failReason == other.failReason &&
        uploadedAt == other.uploadedAt &&
        imageURL == other.imageURL &&
        barcodeNumber == other.barcodeNumber &&
        sellingStatus == other.sellingStatus &&
        resellPrice == other.resellPrice &&
        refund == other.refund &&
        hasProblem == other.hasProblem &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, userId.hashCode),
                                                    status.hashCode),
                                                price.hashCode),
                                            failReason.hashCode),
                                        uploadedAt.hashCode),
                                    imageURL.hashCode),
                                barcodeNumber.hashCode),
                            sellingStatus.hashCode),
                        resellPrice.hashCode),
                    refund.hashCode),
                hasProblem.hashCode),
            version.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GifticonsRecord')
          ..add('userId', userId)
          ..add('status', status)
          ..add('price', price)
          ..add('failReason', failReason)
          ..add('uploadedAt', uploadedAt)
          ..add('imageURL', imageURL)
          ..add('barcodeNumber', barcodeNumber)
          ..add('sellingStatus', sellingStatus)
          ..add('resellPrice', resellPrice)
          ..add('refund', refund)
          ..add('hasProblem', hasProblem)
          ..add('version', version)
          ..add('reference', reference))
        .toString();
  }
}

class GifticonsRecordBuilder
    implements Builder<GifticonsRecord, GifticonsRecordBuilder> {
  _$GifticonsRecord _$v;

  DocumentReference<Object> _userId;
  DocumentReference<Object> get userId => _$this._userId;
  set userId(DocumentReference<Object> userId) => _$this._userId = userId;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  String _failReason;
  String get failReason => _$this._failReason;
  set failReason(String failReason) => _$this._failReason = failReason;

  DateTime _uploadedAt;
  DateTime get uploadedAt => _$this._uploadedAt;
  set uploadedAt(DateTime uploadedAt) => _$this._uploadedAt = uploadedAt;

  String _imageURL;
  String get imageURL => _$this._imageURL;
  set imageURL(String imageURL) => _$this._imageURL = imageURL;

  String _barcodeNumber;
  String get barcodeNumber => _$this._barcodeNumber;
  set barcodeNumber(String barcodeNumber) =>
      _$this._barcodeNumber = barcodeNumber;

  String _sellingStatus;
  String get sellingStatus => _$this._sellingStatus;
  set sellingStatus(String sellingStatus) =>
      _$this._sellingStatus = sellingStatus;

  int _resellPrice;
  int get resellPrice => _$this._resellPrice;
  set resellPrice(int resellPrice) => _$this._resellPrice = resellPrice;

  bool _refund;
  bool get refund => _$this._refund;
  set refund(bool refund) => _$this._refund = refund;

  bool _hasProblem;
  bool get hasProblem => _$this._hasProblem;
  set hasProblem(bool hasProblem) => _$this._hasProblem = hasProblem;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  GifticonsRecordBuilder() {
    GifticonsRecord._initializeBuilder(this);
  }

  GifticonsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _status = $v.status;
      _price = $v.price;
      _failReason = $v.failReason;
      _uploadedAt = $v.uploadedAt;
      _imageURL = $v.imageURL;
      _barcodeNumber = $v.barcodeNumber;
      _sellingStatus = $v.sellingStatus;
      _resellPrice = $v.resellPrice;
      _refund = $v.refund;
      _hasProblem = $v.hasProblem;
      _version = $v.version;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GifticonsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GifticonsRecord;
  }

  @override
  void update(void Function(GifticonsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GifticonsRecord build() {
    final _$result = _$v ??
        new _$GifticonsRecord._(
            userId: userId,
            status: status,
            price: price,
            failReason: failReason,
            uploadedAt: uploadedAt,
            imageURL: imageURL,
            barcodeNumber: barcodeNumber,
            sellingStatus: sellingStatus,
            resellPrice: resellPrice,
            refund: refund,
            hasProblem: hasProblem,
            version: version,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
