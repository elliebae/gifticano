// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.agreeUse;
    if (value != null) {
      result
        ..add('agreeUse')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.agreePersonal;
    if (value != null) {
      result
        ..add('agreePersonal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uploadedCoupon;
    if (value != null) {
      result
        ..add('uploadedCoupon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalPoint;
    if (value != null) {
      result
        ..add('totalPoint')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.availableGifticanoNum;
    if (value != null) {
      result
        ..add('availableGifticanoNum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.checkingGifticonNum;
    if (value != null) {
      result
        ..add('checkingGifticonNum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'agreeUse':
          result.agreeUse = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'agreePersonal':
          result.agreePersonal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'uploadedCoupon':
          result.uploadedCoupon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalPoint':
          result.totalPoint = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'availableGifticanoNum':
          result.availableGifticanoNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'checkingGifticonNum':
          result.checkingGifticonNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final bool agreeUse;
  @override
  final bool agreePersonal;
  @override
  final String uploadedCoupon;
  @override
  final int totalPoint;
  @override
  final int availableGifticanoNum;
  @override
  final int checkingGifticonNum;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.agreeUse,
      this.agreePersonal,
      this.uploadedCoupon,
      this.totalPoint,
      this.availableGifticanoNum,
      this.checkingGifticonNum,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        agreeUse == other.agreeUse &&
        agreePersonal == other.agreePersonal &&
        uploadedCoupon == other.uploadedCoupon &&
        totalPoint == other.totalPoint &&
        availableGifticanoNum == other.availableGifticanoNum &&
        checkingGifticonNum == other.checkingGifticonNum &&
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
                                                $jc($jc(0, email.hashCode),
                                                    displayName.hashCode),
                                                photoUrl.hashCode),
                                            uid.hashCode),
                                        createdTime.hashCode),
                                    phoneNumber.hashCode),
                                agreeUse.hashCode),
                            agreePersonal.hashCode),
                        uploadedCoupon.hashCode),
                    totalPoint.hashCode),
                availableGifticanoNum.hashCode),
            checkingGifticonNum.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('agreeUse', agreeUse)
          ..add('agreePersonal', agreePersonal)
          ..add('uploadedCoupon', uploadedCoupon)
          ..add('totalPoint', totalPoint)
          ..add('availableGifticanoNum', availableGifticanoNum)
          ..add('checkingGifticonNum', checkingGifticonNum)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool _agreeUse;
  bool get agreeUse => _$this._agreeUse;
  set agreeUse(bool agreeUse) => _$this._agreeUse = agreeUse;

  bool _agreePersonal;
  bool get agreePersonal => _$this._agreePersonal;
  set agreePersonal(bool agreePersonal) =>
      _$this._agreePersonal = agreePersonal;

  String _uploadedCoupon;
  String get uploadedCoupon => _$this._uploadedCoupon;
  set uploadedCoupon(String uploadedCoupon) =>
      _$this._uploadedCoupon = uploadedCoupon;

  int _totalPoint;
  int get totalPoint => _$this._totalPoint;
  set totalPoint(int totalPoint) => _$this._totalPoint = totalPoint;

  int _availableGifticanoNum;
  int get availableGifticanoNum => _$this._availableGifticanoNum;
  set availableGifticanoNum(int availableGifticanoNum) =>
      _$this._availableGifticanoNum = availableGifticanoNum;

  int _checkingGifticonNum;
  int get checkingGifticonNum => _$this._checkingGifticonNum;
  set checkingGifticonNum(int checkingGifticonNum) =>
      _$this._checkingGifticonNum = checkingGifticonNum;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _agreeUse = $v.agreeUse;
      _agreePersonal = $v.agreePersonal;
      _uploadedCoupon = $v.uploadedCoupon;
      _totalPoint = $v.totalPoint;
      _availableGifticanoNum = $v.availableGifticanoNum;
      _checkingGifticonNum = $v.checkingGifticonNum;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            agreeUse: agreeUse,
            agreePersonal: agreePersonal,
            uploadedCoupon: uploadedCoupon,
            totalPoint: totalPoint,
            availableGifticanoNum: availableGifticanoNum,
            checkingGifticonNum: checkingGifticonNum,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
