import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String returnEmptyString() {
  return "";
}

bool isGreaterThanInput(
  int totalPoint,
  int threshold,
) {
  if (totalPoint >= threshold) {
    return true;
  }
  return false;
}

int minus4500(int totalPoint) {
  return 4500 - totalPoint;
}

bool isDisplayNameNull(String displayName) {
  // check if a string is null
  return displayName == null || displayName.isEmpty;
}

String printStatus(String status) {
  // return "통" if input is "pass", return " 반" if input is"fail", return "검수 대기 중" if input is "waiting"
  if (status == "pass") {
    return "등록 완료";
  } else if (status == "fail") {
    return "검수 반려";
  } else if (status == "waiting") {
    return "검수 대기 중";
  }
  return null;
}

int pointToRefund(
  int presentPoint,
  int gifticonPrice,
) {
  if (presentPoint - gifticonPrice > 0) {
    return gifticonPrice;
  } else {
    return presentPoint;
  }
}

int moneyToSend(
  int presentPoint,
  int gifticonPrice,
) {
  // Add your function code here!
  if (gifticonPrice <= presentPoint) {
    return 0;
  } else {
    return gifticonPrice - presentPoint;
  }
}
