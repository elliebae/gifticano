import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main/main_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PointWidget extends StatefulWidget {
  const PointWidget({Key key}) : super(key: key);

  @override
  _PointWidgetState createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/cancel-icon.png',
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    '포인트',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 19, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              child: Text(
                                '${currentUserDisplayName}님의 포인트',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF666666),
                                  lineHeight: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                child: Text(
                                  '${currentUserDocument?.totalPoint.toString()}',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xFF999999),
                        ),
                        if (!(functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 4500)) ??
                            true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/coffee-icon.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${functions.minus4500(currentUserDocument?.totalPoint).toString()} 포인트를 더 모으면',
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          '아메리카노 한 잔으로 바꿀 수 있어요',
                                          style: FlutterFlowTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 4500) ??
                            true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/pop-icon.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '포인트를 아메리카노로 바꿔보세요!',
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
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
                    width: 150,
                    height: 225,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/cup-0.png',
                        ).image,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 4500) ??
                            true)
                          AuthUserStreamWidget(
                            child: Image.asset(
                              'assets/images/cup-5.png',
                              width: 150,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 3375) ??
                            true)
                          AuthUserStreamWidget(
                            child: Image.asset(
                              'assets/images/cup-4.png',
                              width: 150,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 2250) ??
                            true)
                          AuthUserStreamWidget(
                            child: Image.asset(
                              'assets/images/cup-3.png',
                              width: 150,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (functions.isGreaterThanInput(
                                currentUserDocument?.totalPoint, 1125) ??
                            true)
                          AuthUserStreamWidget(
                            child: Image.asset(
                              'assets/images/cup-2.png',
                              width: 150,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Image.asset(
                          'assets/images/cup-1.png',
                          width: 150,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (functions.isGreaterThanInput(
                              currentUserDocument?.totalPoint, 4500) ??
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                          child: AuthUserStreamWidget(
                            child: StreamBuilder<List<GifticanosRecord>>(
                              stream: queryGifticanosRecord(
                                queryBuilder: (gifticanosRecord) =>
                                    gifticanosRecord.where('userId',
                                        isEqualTo:
                                            functions.returnEmptyString()),
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
                                List<GifticanosRecord>
                                    buttonGifticanosRecordList = snapshot.data;
                                final buttonGifticanosRecord =
                                    buttonGifticanosRecordList.isNotEmpty
                                        ? buttonGifticanosRecordList.first
                                        : null;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('포인트를 아메리카노로 바꿀까요?'),
                                          content:
                                              Text('한 잔에 4,500  포인트가 차감됩니다.'),
                                          //예쁘게
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          //
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('아니요'),
                                              //예쁘게
                                              style: TextButton.styleFrom(
                                                primary: Color(0xFF666666), //글자
                                                backgroundColor: Color(0xFFF2F3F2),
                                                padding: EdgeInsets.all(16.0),
                                                minimumSize: Size(135, 55), //최소 사이즈
                                                shape:
                                                StadiumBorder(), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                                              ),
                                              //
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                Navigator.pop(
                                                    alertDialogContext);

                                                final gifticanosUpdateData =
                                                    createGifticanosRecordData(
                                                  userId: currentUserUid,
                                                );
                                                await buttonGifticanosRecord
                                                    .reference
                                                    .update(
                                                        gifticanosUpdateData);
                                                ;
                                              },
                                              child: Text('바꿀게요'),
                                              //예쁘게
                                              style: TextButton.styleFrom(
                                                primary: Color(0xFFFFFFFF), //글자
                                                backgroundColor: Color(0xFF3D8566),
                                                padding: EdgeInsets.all(16.0),
                                                minimumSize: Size(135, 55), //최소 사이즈
                                                shape:
                                                StadiumBorder(), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                                              ),
                                              //
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if ((currentUserDocument?.totalPoint) >=
                                        4500) {
                                      final usersUpdateData = {
                                        'totalPoint':
                                            FieldValue.increment(-4500),
                                        'availableGifticanoNum':
                                            FieldValue.increment(1),
                                      };
                                      await currentUserReference
                                          .update(usersUpdateData);
                                    } else {
                                      return;
                                    }
                                    final pointHistoryCreateData =
                                        createPointHistoryRecordData(
                                      userId: currentUserReference,
                                      amount: -4500,
                                      memo: '포인트 사용',
                                    );
                                    await PointHistoryRecord.collection
                                        .doc()
                                        .set(pointHistoryCreateData);
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: '아메리카노로 바꾸기',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: Color(0xFF333333),
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
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
