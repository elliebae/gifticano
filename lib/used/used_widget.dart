import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/refund_information_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsedWidget extends StatefulWidget {
  const UsedWidget({Key key}) : super(key: key);

  @override
  _UsedWidgetState createState() => _UsedWidgetState();
}

class _UsedWidgetState extends State<UsedWidget> {
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
                      '?????? ????????? ????????????',
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
                        .where('hasProblem', isEqualTo: true)
                        .where('refund', isEqualTo: false),
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
                        return Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.85,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.height * 0.5,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Image.network(
                                  listViewGifticonsRecord.imageURL,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                  MediaQuery.of(context).size.height * 0.5,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  '${dateTimeFormat('M/d h:mm a', listViewGifticonsRecord.uploadedAt)}??? ????????? ??????????????? ?????? ??????????????? ????????? ?????????????????????.\n????????? ?????????????????????? ????????????! ?????????????????? ???????????? ??????????????????.',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    lineHeight: 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 16),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                          MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 320,
                                            child: RefundInformationWidget(
                                              gifticon: listViewGifticonsRecord,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  text: '?????? ????????????',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 55,
                                    color: FlutterFlowTheme
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme
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
                                    borderRadius: 12,
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await launchURL(
                                      'http://pf.kakao.com/_yxaUSb/chat');
                                },
                                text: '????????????',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 55,
                                  color:
                                  FlutterFlowTheme.customColor3,
                                  textStyle: FlutterFlowTheme
                                      .subtitle2
                                      .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme
                                        .secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ],
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