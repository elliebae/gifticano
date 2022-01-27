import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'gifticons_record.g.dart';

abstract class GifticonsRecord
    implements Built<GifticonsRecord, GifticonsRecordBuilder> {
  static Serializer<GifticonsRecord> get serializer =>
      _$gifticonsRecordSerializer;

  @nullable
  DocumentReference get userId;

  @nullable
  String get status;

  @nullable
  int get price;

  @nullable
  String get failReason;

  @nullable
  DateTime get uploadedAt;

  @nullable
  String get imageURL;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GifticonsRecordBuilder builder) => builder
    ..status = ''
    ..price = 0
    ..failReason = ''
    ..imageURL = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Gifticons');

  static Stream<GifticonsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<GifticonsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GifticonsRecord._();
  factory GifticonsRecord([void Function(GifticonsRecordBuilder) updates]) =
      _$GifticonsRecord;

  static GifticonsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGifticonsRecordData({
  DocumentReference userId,
  String status,
  int price,
  String failReason,
  DateTime uploadedAt,
  String imageURL,
}) =>
    serializers.toFirestore(
        GifticonsRecord.serializer,
        GifticonsRecord((g) => g
          ..userId = userId
          ..status = status
          ..price = price
          ..failReason = failReason
          ..uploadedAt = uploadedAt
          ..imageURL = imageURL));
