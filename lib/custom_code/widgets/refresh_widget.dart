// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:async';
import 'package:after_layout/after_layout.dart';

class RefreshWidget extends StatefulWidget {
  const RefreshWidget({
    Key key,
    this.width,
    this.height,
    this.interval,
  }) : super(key: key);

  final double width;
  final double height;
  final int interval;

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget>
    with AfterLayoutMixin<RefreshWidget> {
  Timer _timer;
  int _start;

  void startTimer(int interval) {
    _start = interval;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          // Navigate to ourselves
          Navigator.pushReplacementNamed(
              context, ModalRoute.of(context).settings.name);
        } else {
          _start--;
        }
      },
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    int interval = widget.interval;
    // For safety
    if (interval == 0 || interval == null) interval = 100;

    // Start the timer
    startTimer(interval);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: Color(0x00000000)),
    );
  }
}
