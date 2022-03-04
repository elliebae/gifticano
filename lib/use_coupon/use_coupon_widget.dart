import 'package:flutter/services.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main/main_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseCouponWidget extends StatefulWidget {
  const UseCouponWidget({Key key}) : super(key: key);

  @override
  _UseCouponWidgetState createState() => _UseCouponWidgetState();
}

class _UseCouponWidgetState extends State<UseCouponWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF2F3F2),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.customColor3,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainWidget(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/cancel-icon.png',
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    '기프티콘 사용',
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
              child: StreamBuilder<List<GifticanosRecord>>(
                stream: queryGifticanosRecord(
                  queryBuilder: (gifticanosRecord) => gifticanosRecord
                      .where('userId', isEqualTo: currentUserUid)
                      .where('used', isEqualTo: false)
                      .orderBy('validDate'),
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
                  List<GifticanosRecord> listViewGifticanosRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewGifticanosRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewGifticanosRecord =
                      listViewGifticanosRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0xFFDCDCDC),
                                offset: Offset(0, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  listViewGifticanosRecord.barcodeImageUrl,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                  MediaQuery.of(context).size.height * 0.2,
                                  fit: BoxFit.fitWidth,
                                ),
                                // FFButtonWidget(
                                //   onPressed: () {
                                //     final data = ClipboardData(text: listViewGifticanosRecord.barcodeNumber);
                                //     Clipboard.setData(data);
                                //   },
                                //   text: '바코드 복사',
                                //   options: FFButtonOptions(
                                //     width: 100,
                                //     height: 30,
                                //     color: Color(0xFFB3B3B3),
                                //     textStyle: FlutterFlowTheme
                                //         .subtitle2
                                //         .override(
                                //       fontFamily: 'Roboto',
                                //       color: Colors.white,
                                //       fontSize: 10,
                                //     ),
                                //     borderSide: BorderSide(
                                //       color: Colors.transparent,
                                //       width: 1,
                                //     ),
                                //     borderRadius: 12,
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '유효 기간',
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                      Text(
                                        listViewGifticanosRecord.validDate,
                                        style: FlutterFlowTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('기프티콘을 사용하셨나요?'),
                                          content: Text('사용완료를 누르시면 다시 사용하실 수 없습니다.'),
                                          //예쁘게
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          //
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('아직이요'),
                                              //예쁘게
                                              style: TextButton.styleFrom(
                                                primary: Color(0xFF666666), //글자
                                                backgroundColor: Color(0xFFF2F3F2),
                                                padding: EdgeInsets.all(10.0),
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
                                                  used: true,
                                                  usedAt: getCurrentTimestamp,
                                                  version: '220304'
                                                );
                                                await listViewGifticanosRecord
                                                    .reference
                                                    .update(
                                                    gifticanosUpdateData);
                                                ;
                                                // final usersUpdateData = {
                                                //   'availableGifticanoNum':
                                                //   FieldValue.increment(-1),
                                                // };
                                                // await currentUserReference
                                                //     .update(usersUpdateData);
                                                await Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => MainWidget(),
                                                  ),
                                                      (r) => false,
                                                );
                                              },
                                              child: Text('사용완료'),
                                              //예쁘게
                                              style: TextButton.styleFrom(
                                                primary: Color(0xFFFFFFFF), //글자
                                                backgroundColor: Color(0xFF3D8566),
                                                padding: EdgeInsets.all(10.0),
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

                                  },
                                  text: '사용 완료',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: FlutterFlowTheme.primaryColor,
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
                                    borderRadius: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}