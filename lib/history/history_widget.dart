import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key key}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        //여기 이게 맞는지 모르겠다
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/cancel-icon.png',
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '등록 내역',
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
                child: StreamBuilder<List<GifticonsRecord>>(
                  stream: queryGifticonsRecord(
                    queryBuilder: (gifticonsRecord) => gifticonsRecord
                        .where('userId', isEqualTo: currentUserReference)
                        .orderBy('uploadedAt', descending: true),
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
                    List<GifticonsRecord> listViewGifticonsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewGifticonsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewGifticonsRecord =
                        listViewGifticonsRecordList[listViewIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.26,
                                  height:
                                  MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              listViewGifticonsRecord.imageURL,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: listViewGifticonsRecord
                                                .imageURL,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: listViewGifticonsRecord.imageURL,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: Image.network(
                                          listViewGifticonsRecord.imageURL,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.26,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.2,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        functions.printStatus(
                                            listViewGifticonsRecord.status),
                                        style: FlutterFlowTheme
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                      ),
                                      if ((listViewGifticonsRecord.status) ==
                                          'pass')
                                        Text(
                                          '바코드: ${listViewGifticonsRecord.barcodeNumber}',
                                          style: FlutterFlowTheme
                                              .bodyText2
                                              .override(
                                            fontFamily: 'Roboto',
                                            lineHeight: 1.3,
                                          ),
                                        ),
                                      if ((listViewGifticonsRecord.status) ==
                                          'fail')
                                        Text(
                                          '반려 사유:${listViewGifticonsRecord.failReason}',
                                          style: FlutterFlowTheme
                                              .bodyText2
                                              .override(
                                            fontFamily: 'Roboto',
                                            lineHeight: 1.3,
                                          ),
                                        ),
                                      Text(
                                        '등록일자: ${dateTimeFormat('M/d H:mm', listViewGifticonsRecord.uploadedAt)}',
                                        style: FlutterFlowTheme
                                            .bodyText2
                                            .override(
                                          fontFamily: 'Roboto',
                                          lineHeight: 1.3,
                                        ),
                                      ),
                                      if ((listViewGifticonsRecord.status) ==
                                          'waiting')
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await listViewGifticonsRecord
                                                  .reference
                                                  .delete();
                                            },
                                            text: '취소',
                                            options: FFButtonOptions(
                                              width: 67,
                                              height: 35,
                                              color: Color(0xFFFCEFEE),
                                              textStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFDD5257),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}