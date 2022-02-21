// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:gifticano/history/history_widget.dart';
import 'package:gifticano/point/point_widget.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:gifticano/landing/landing_widget.dart';
import 'package:gifticano/main/main_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<GifticanoFirebaseUser> userStream;
  GifticanoFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    //dynamic
    _initDynamicLinks();
    //
    userStream = gifticanoFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }


  //dynamic
  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          print("deeplink found");
          print(deepLink.path);

          if (deepLink != null) {
            _handleDynamicLink(deepLink);
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      _handleDynamicLink(deepLink);
    }
  }

  void _handleDynamicLink(Uri deepLink) {
    switch (deepLink.path) {
      case "/point":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => PointWidget()));
    }
  }




  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifticano',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedSplashScreen(
        splash: Image.asset(
            'assets/images/SplashScreen.png',
        ),
        splashIconSize: double.maxFinite,
        backgroundColor: Colors.white,
        nextScreen: currentUser.loggedIn
                ? MainWidget()
                : LandingWidget(),
      )
      // : initialUser == null || displaySplashImage
      //     ? Container(
      //         color: Colors.white,
      //         child: Builder(
      //           builder: (context) => Image.asset(
      //             'assets/images/Untitled_-SplashScreen_(3)_(1).gif',
      //             fit: BoxFit.scaleDown,
      //           ),
      //         ),
      //       )
      //     : currentUser.loggedIn
      //         ? MainWidget()
      //         : LandingWidget(),
    );
  }
}
