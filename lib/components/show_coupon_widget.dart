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
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '를 ',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '1잔',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '사용합니다',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    '스타벅스 매장에서 결제 시',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Roboto',
                      color: Color(0xFF666666),
                      lineHeight: 1.5,
                    ),
                  ),
                ),
                Text(
                  '직원에게 아래 바코드를 보여주세요.',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF666666),
                    lineHeight: 1.5,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Image.network(
                  'https://picsum.photos/seed/993/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 17),
                  child: Text(
                    '결제 후 반드시 사용 완료를 눌러주세요.',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('기프티콘을 사용하셨나요?'),
                            content: Text('사용완료를 누르시면 다시 사용하실 수 없습니다.'),
                            //예쁘게
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))
                            ),
                            //
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(
                                        alertDialogContext),
                                child: Text('아직이요'),
                                //예쁘게
                                style: TextButton.styleFrom(
                                  primary: Color(0xFF666666),
                                  //글자
                                  backgroundColor: Color(0xFFF2F3F2),
                                  padding: EdgeInsets.all(10.0),
                                  minimumSize: Size(135, 55),
                                  //최소 사이즈
                                  shape:
                                  StadiumBorder(), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                                ),
                                //
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(
                                      alertDialogContext);

                                  //여기에 api call

                                },
                                child: Text('사용완료'),
                                //예쁘게
                                style: TextButton.styleFrom(
                                  primary: Color(0xFFFFFFFF),
                                  //글자
                                  backgroundColor: Color(0xFF3D8566),
                                  padding: EdgeInsets.all(10.0),
                                  minimumSize: Size(135, 55),
                                  //최소 사이즈
                                  shape:
                                  StadiumBorder(), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                                ),
                                //
                              ),
                            ],
                          );
                        }
                    ),
                  text: '사용 완료',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 55,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.subtitle2.override(
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