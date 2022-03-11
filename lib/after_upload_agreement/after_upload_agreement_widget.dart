import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main/main_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterUploadAgreementWidget extends StatefulWidget {
  const AfterUploadAgreementWidget({
    Key key,
    this.gifticonImageUrl,
  }) : super(key: key);

  final String gifticonImageUrl;

  @override
  _AfterUploadAgreementWidgetState createState() =>
      _AfterUploadAgreementWidgetState();
}

class _AfterUploadAgreementWidgetState
    extends State<AfterUploadAgreementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/back-icon.png',
                            width: 30,
                            fit: BoxFit.cover,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '기프티콘이 검수를 통과하면',
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                        child: Image.asset(
                          'assets/images/coffee-sign.png',
                          width: 58,
                          height: 58,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '스타벅스 아메리카노를 드려요',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                          Text(
                            '내가 마시고 싶을 때 언제든지 꺼내 쓸 수 있어요',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                        child: Image.asset(
                          'assets/images/point-sign.png',
                          width: 58,
                          height: 58,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '거스름돈은 포인트로 적립해드려요',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                          Text(
                            '4500 포인트를 모아 기프티카노로 교환해보세요.',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                        child: Image.asset(
                          'assets/images/refund-sign.png',
                          width: 58,
                          height: 58,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '등록한 기프티콘은 환불할 수 없어요',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                          Text(
                            '검수 통과 전 취소는 ‘등록내역’에서 할 수 있어요.',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            setState(() => FFAppState().neverSeeAgain =
                                !FFAppState().neverSeeAgain);
                          },
                          value: FFAppState().neverSeeAgain,
                          onIcon: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 25,
                          ),
                          offIcon: Icon(
                            Icons.check_circle,
                            color: Color(0xFF999999),
                            size: 25,
                          ),
                        ),
                        Text(
                          '다시 보지 않기',
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF999999),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainWidget(),
                                ),
                              );
                            },
                            text: '취소할게요',
                            options: FFButtonOptions(
                              width: 130,
                              height: 55,
                              color: Color(0xFFF2F3F2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.bold,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 15,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('기프티콘을 아메리카노로 바꿀까요?'),
                                            content: Text('언제든 다시 등록할 수 있어요.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('아니요'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('등록할게요'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;

                              final gifticonsCreateData =
                                  createGifticonsRecordData(
                                userId: currentUserReference,
                                status: 'waiting',
                                uploadedAt: getCurrentTimestamp,
                                imageURL: widget.gifticonImageUrl,
                                sellingStatus: 'stock',
                                refund: false,
                                hasProblem: false,
                                version: '220310',
                              );
                              await GifticonsRecord.collection
                                  .doc()
                                  .set(gifticonsCreateData);
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('기프티콘이 등록되었습니다.'),
                                    content: Text(
                                        '검수가 완료되면 알림톡을 보내드릴게요. 검수에 통과하면 등록하신 기프티콘은 자동으로 아메리카노로 바꿔드립니다.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('메인화면으로 갈래요'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: '등록할게요',
                            options: FFButtonOptions(
                              width: 130,
                              height: 55,
                              color: Color(0xFFE15241),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 15,
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
    );
  }
}
