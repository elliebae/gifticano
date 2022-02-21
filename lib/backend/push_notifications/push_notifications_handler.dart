import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../landing/landing_widget.dart';
import '../../phone_number/phone_number_widget.dart';
import '../../phone_number_verify/phone_number_verify_widget.dart';
import '../../name/name_widget.dart';
import '../../onboarding/onboarding_widget.dart';
import '../../input_coupon/input_coupon_widget.dart';
import '../../point/point_widget.dart';
import '../../use_coupon/use_coupon_widget.dart';
import '../../phone_number_login/phone_number_login_widget.dart';
import '../../phone_number_verify_login/phone_number_verify_login_widget.dart';
import '../../history/history_widget.dart';
import '../../used/used_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/Untitled_-SplashScreen_(3)_(1).gif',
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Landing': (data) async => LandingWidget(),
  'PhoneNumber': (data) async => PhoneNumberWidget(),
  'PhoneNumberVerify': (data) async => PhoneNumberVerifyWidget(
        phoneNumber: getParameter(data, 'phoneNumber'),
      ),
  'Name': (data) async => NameWidget(),
  'Onboarding': (data) async => OnboardingWidget(),
  'InputCoupon': (data) async => InputCouponWidget(),
  'Point': (data) async => PointWidget(),
  'UseCoupon': (data) async => UseCouponWidget(),
  'PhoneNumber_login': (data) async => PhoneNumberLoginWidget(),
  'PhoneNumberVerify_login': (data) async => PhoneNumberVerifyLoginWidget(),
  'History': (data) async => HistoryWidget(),
  'Used': (data) async => UsedWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
