// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PointHistoryRecord> _$pointHistoryRecordSerializer =
    new _$PointHistoryRecordSerializer();

class _$PointHistoryRecordSerializer
    implements StructuredSerializer<PointHistoryRecord> {
  @override
  final Iterable<Type> types = const [PointHistoryRecord, _$PointHistoryRecord];
  @override
  final String wireName = 'PointHistoryRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PointHistoryRecord object,
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
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.memo;
    if (value != null) {
      result
        ..add('memo')
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
  PointHistoryRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PointHistoryRecordBuilder();

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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'memo':
          result.memo = serializers.deserialize(value,
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

class _$PointHistoryRecord extends PointHistoryRecord {
  @override
  final DocumentReference<Object> userId;
  @override
  final int amount;
  @override
  final String memo;
  @override
  final DocumentReference<Object> reference;

  factory _$PointHistoryRecord(
          [void Function(PointHistoryRecordBuilder) updates]) =>
      (new PointHistoryRecordBuilder()..update(updates)).build();

  _$PointHistoryRecord._({this.userId, this.amount, this.memo, this.reference})
      : super._();

  @override
  PointHistoryRecord rebuild(
          void Function(PointHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PointHistoryRecordBuilder toBuilder() =>
      new PointHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PointHistoryRecord &&
        userId == other.userId &&
        amount == other.amount &&
        memo == other.memo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), amount.hashCode), memo.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PointHistoryRecord')
          ..add('userId', userId)
          ..add('amount', amount)
          ..add('memo', memo)
          ..add('reference', reference))
        .toString();
  }
}

class PointHistoryRecordBuilder
    implements Builder<PointHistoryRecord, PointHistoryRecordBuilder> {
  _$PointHistoryRecord _$v;

  DocumentReference<Object> _userId;
  DocumentReference<Object> get userId => _$this._userId;
  set userId(DocumentReference<Object> userId) => _$this._userId = userId;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  String _memo;
  String get memo => _$this._memo;
  set memo(String memo) => _$this._memo = memo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PointHistoryRecordBuilder() {
    PointHistoryRecord._initializeBuilder(this);
  }

  PointHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _amount = $v.amount;
      _memo = $v.memo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PointHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PointHistoryRecord;
  }

  @override
  void update(void Function(PointHistoryRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PointHistoryRecord build() {
    final _$result = _$v ??
        new _$PointHistoryRecord._(
            userId: userId, amount: amount, memo: memo, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
