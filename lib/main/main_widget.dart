import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../history/history_widget.dart';
import '../landing/landing_widget.dart';
import '../onboarding/onboarding_widget.dart';
import '../point/point_widget.dart';
import '../use_coupon/use_coupon_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                              style: FlutterFlowTheme.subtitle1.override(
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PointWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                '${currentUserDocument?.totalPoint.toString()}포인트 >',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryWidget(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HistoryWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                '기프티콘 등록내역 >',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.customColor1,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                            await launchURL(
                                'https://a3889xroicn.typeform.com/to/TmH5SxId');
                          },
                          child: Text(
                            '문의하기',
                            style: FlutterFlowTheme.subtitle1.override(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://sites.google.com/view/gifticano-agreement-personal/');
                          },
                          child: Text(
                            '개인정보 처리방침',
                            style: FlutterFlowTheme.subtitle1.override(
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
                            '이용약관',
                            style: FlutterFlowTheme.subtitle1.override(
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
                          '버전',
                          style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Roboto',
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '1.0.0',
                          style: FlutterFlowTheme.subtitle1.override(
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
                            '로그아웃',
                            style: FlutterFlowTheme.subtitle1.override(
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
                            '회원탈퇴',
                            style: FlutterFlowTheme.subtitle1.override(
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
                      '기프티카노',
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'gmarket sans',
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingWidget(),
                        ),
                      );
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
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '사용할 수 있는 기프티카노',
                                  style: FlutterFlowTheme.subtitle1.override(
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
                                    '${currentUserDocument?.availableGifticanoNum.toString()}잔',
                                    style: FlutterFlowTheme.subtitle1.override(
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
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UseCouponWidget(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '사용하기',
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.primaryColor,
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
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '검수 중인 기프티콘',
                                  style: FlutterFlowTheme.subtitle1.override(
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
                                    '${currentUserDocument?.checkingGifticonNum.toString()}장',
                                    style: FlutterFlowTheme.subtitle1.override(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Text(
                                  '검수는 최대 24시간이 소요됩니다. 검수가 완료되는 대로\n문자로 알려드릴게요! 조금만 기다려주세요.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.secondaryColor,
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
  }
}
