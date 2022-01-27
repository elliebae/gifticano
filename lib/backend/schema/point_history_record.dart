import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'point_history_record.g.dart';

abstract class PointHistoryRecord
    implements Built<PointHistoryRecord, PointHistoryRecordBuilder> {
  static Serializer<PointHistoryRecord> get serializer =>
      _$pointHistoryRecordSerializer;

  @nullable
  DocumentReference get userId;

  @nullable
  int get amount;

  @nullable
  String get memo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PointHistoryRecordBuilder builder) => builder
    ..amount = 0
    ..memo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PointHistory');

  static Stream<PointHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PointHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PointHistoryRecord._();
  factory PointHistoryRecord(
          [void Function(PointHistoryRecordBuilder) updates]) =
      _$PointHistoryRecord;

  static PointHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPointHistoryRecordData({
  DocumentReference userId,
  int amount,
  String memo,
}) =>
    serializers.toFirestore(
        PointHistoryRecord.serializer,
        PointHistoryRecord((p) => p
          ..userId = userId
          ..amount = amount
          ..memo = memo));
