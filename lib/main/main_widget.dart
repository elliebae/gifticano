import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/show_coupon_widget.dart';
import '../customer_service/customer_service_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../history/history_widget.dart';
import '../input_coupon/input_coupon_widget.dart';
import '../landing/landing_widget.dart';
import '../onboarding/onboarding_widget.dart';
import '../point/point_widget.dart';
import '../use_coupon/use_coupon_widget.dart';
import '../used/used_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GifticonsRecord>>(
      stream: queryGifticonsRecord(
        queryBuilder: (gifticonsRecord) => gifticonsRecord
            .where('userId', isEqualTo: currentUserReference)
            .where('hasProblem', isEqualTo: true)
            .where('refund', isNotEqualTo: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<GifticonsRecord> mainGifticonsRecordList = snapshot.data;
        final mainGifticonsRecord = mainGifticonsRecordList.isNotEmpty
            ? mainGifticonsRecordList.first
            : null;
        return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        elevation: 16,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40, 90, 40, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            child: Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme
                                  .subtitle1
                                  .override(
                                fontFamily: 'Roboto',
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PointWidget(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.coins,
                                    color: FlutterFlowTheme
                                        .secondaryColor,
                                    size: 30,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PointWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '?????????',
                                    style: FlutterFlowTheme
                                        .bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryWidget(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.history,
                                    color: FlutterFlowTheme
                                        .secondaryColor,
                                    size: 30,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HistoryWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '????????????',
                                    style: FlutterFlowTheme
                                        .bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UsedWidget(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.tasks,
                                    color: FlutterFlowTheme
                                        .secondaryColor,
                                    size: 30,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PointWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '????????????',
                                    style: FlutterFlowTheme
                                        .bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CustomerServiceWidget(),
                              ),
                            );
                          },
                          child: Text(
                            '????????????',
                            style: FlutterFlowTheme
                                .subtitle1
                                .override(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://sites.google.com/view/gifticano-agreement-personal/');
                          },
                          child: Text(
                            '???????????? ????????????',
                            style: FlutterFlowTheme
                                .subtitle1
                                .override(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://sites.google.com/view/gitfticano-agreement-use/');
                          },
                          child: Text(
                            '????????????',
                            style: FlutterFlowTheme
                                .subtitle1
                                .override(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '??????',
                          style: FlutterFlowTheme
                              .subtitle1
                              .override(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '1.0.0',
                          style: FlutterFlowTheme
                              .subtitle1
                              .override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF666666),
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandingWidget(),
                              ),
                                  (r) => false,
                            );
                          },
                          child: Text(
                            '????????????',
                            style: FlutterFlowTheme
                                .subtitle1
                                .override(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://a3889xroicn.typeform.com/to/sXy5DXFm');
                          },
                          child: Text(
                            '????????????',
                            style: FlutterFlowTheme
                                .subtitle1
                                .override(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 43),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset(
                          'assets/images/menu-icon.png',
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          '???????????????',
                          style:
                          FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'gmarket sans',
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if ((mainGifticonsRecord != null)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('??????! ??????????????? ???????????? ??????...'),
                                  content: Text('?????? ????????? ??????????????? ?????? ?????? ????????? ????????????.'),
                                  //?????????
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  //
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                  Navigator.pop(alertDialogContext);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UsedWidget()));

                                },

                                      child: Text('???????????? ??????'),
                                      //?????????
                                      style: TextButton.styleFrom(
                                        primary: Color(0xFFFFFFFF), //??????
                                        backgroundColor: Color(0xFF3D8566),
                                        padding: EdgeInsets.all(10.0),
                                        minimumSize: Size(135, 55), //?????? ?????????
                                        shape:
                                        StadiumBorder(), // : ????????????, CircleBorder : ??????????????????, StadiumBorder : ???????????? ????????????,
                                      ),
                                      //
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InputCouponWidget(),
                              ),
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/images/add-icon.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFFE9FAED),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFB3B3B3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100,
                                  height:
                                  MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '????????? ??? ?????? ???????????????',
                                      style: FlutterFlowTheme
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF333333),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AuthUserStreamWidget(
                                      child: Text(
                                        '${currentUserDocument?.availableGifticanoNum.toString()}???',
                                        style: FlutterFlowTheme
                                            .subtitle1
                                            .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/coffee.png',
                              width: 80,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Color(0xFFBEF4CE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: InkWell(
                                //???????????? ?????? action
                                onTap: () async {
                                  //0??? ?????? alertdialog
                                  if (currentUserDocument?.availableGifticanoNum == 0) {
                                    return;
                                  }
                                  print("?????? ????????? ?????? ????????????");
                                  await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 535,
                                            child: ShowCouponWidget(),
                                          ),
                                        );
                                      },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '????????????',
                                      style: FlutterFlowTheme
                                          .subtitle2
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme
                                            .primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5EFFD),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFB3B3B3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100,
                                  height:
                                  MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '?????? ?????? ????????????',
                                      style: FlutterFlowTheme
                                          .subtitle1
                                          .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF333333),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AuthUserStreamWidget(
                                      child: Text(
                                        '${currentUserDocument?.checkingGifticonNum.toString()}???',
                                        style: FlutterFlowTheme
                                            .subtitle1
                                            .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/time.png',
                              width: 80,
                              height: 120,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Color(0x00BEF4CE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      '????????? ?????? 24????????? ???????????????. ????????? ???????????? ??????\n????????? ??????????????????! ????????? ??????????????????.',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: FlutterFlowTheme
                                            .secondaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}