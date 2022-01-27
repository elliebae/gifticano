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
