import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCouponWidget extends StatefulWidget {
  const ShowCouponWidget({Key key}) : super(key: key);

  @override
  _ShowCouponWidgetState createState() => _ShowCouponWidgetState();
}

class _ShowCouponWidgetState extends State<ShowCouponWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0xFFF2F3F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 48, 20, 34),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '기프티카노',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '를 ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      '1잔',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Text(
                  '사용합니다',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    '스타벅스 매장에서 결제 시',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFF666666),
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Text(
                  '직원에게 아래 바코드를 보여주세요.',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF666666),
                        lineHeight: 1.5,
                      ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: Image.network(
                      'https://picsum.photos/seed/993/600',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    '유효 기간 : dummy data',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 17),
                  child: Text(
                    '결제 후 반드시 사용 완료를 눌러주세요.',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: '사용 완료',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 55,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
