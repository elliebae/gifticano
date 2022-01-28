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
              height: 120,
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
            StreamBuilder<List<GifticanosRecord>>(
              stream: queryGifticanosRecord(
                queryBuilder: (gifticanosRecord) => gifticanosRecord
                    .where('used', isEqualTo: false)
                    .where('userId', isEqualTo: currentUserUid)
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
                List<GifticanosRecord> columnGifticanosRecordList =
                    snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnGifticanosRecordList.length,
                      (columnIndex) {
                    final columnGifticanosRecord =
                        columnGifticanosRecordList[columnIndex];
                    return Container(
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
                        padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              columnGifticanosRecord.barcodeImageUrl,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              fit: BoxFit.fitWidth,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                                    columnGifticanosRecord.validDate,
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
                                      title: Text('진짜 쓴거?'),
                                      content: Text('레알?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('노노'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(alertDialogContext);

                                            final gifticanosUpdateData =
                                                createGifticanosRecordData(
                                              used: true,
                                              usedAt: getCurrentTimestamp,
                                            );
                                            await columnGifticanosRecord
                                                .reference
                                                .update(gifticanosUpdateData);
                                            ;
                                          },
                                          child: Text('진짜 썼다!'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                final usersUpdateData = {
                                  'availableGifticanoNum':
                                      FieldValue.increment(-1),
                                };
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: '사용 완료',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 55,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
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
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
