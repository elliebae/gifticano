import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../onboarding/onboarding_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgreementWidget extends StatefulWidget {
  const AgreementWidget({Key key}) : super(key: key);

  @override
  _AgreementWidgetState createState() => _AgreementWidgetState();
}

class _AgreementWidgetState extends State<AgreementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF707070),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 35, 0, 20),
                              child: Text(
                                '약관 동의가 필요합니다.',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    setState(() => FFAppState().agreePersonal =
                                        !FFAppState().agreePersonal);
                                  },
                                  value: FFAppState().agreePersonal,
                                  onIcon: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF3D8566),
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF999999),
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  '개인정보 처리방침에 동의 (필수)',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                await launchURL(
                                    'https://sites.google.com/view/gifticano-agreement-personal/');
                              },
                              child: Text(
                                '보기',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    setState(() => FFAppState().agreeUse =
                                        !FFAppState().agreeUse);
                                  },
                                  value: FFAppState().agreeUse,
                                  onIcon: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF3D8566),
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF999999),
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  '이용약관에 동의 (필수)',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                await launchURL(
                                    'https://sites.google.com/view/gitfticano-agreement-use/');
                              },
                              child: Text(
                                '보기',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      final usersUpdateData = createUsersRecordData(
                        agreeUse: true,
                        agreePersonal: true,
                      );
                      await currentUserReference.update(usersUpdateData);
                      // currentUserDocument?.agreePersonal
                      if (FFAppState().agreePersonal & FFAppState().agreeUse) {
                        print("pass");
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingWidget(),
                          ),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('약관에 모두 동의해주세요.'),
                              content: Text(
                                  '회원가입을 위해서 필수 약관에 모두 동의해주셔야 합니다.'),
                              //예쁘게
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              //
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('닫기'),
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
                              ],
                            );
                          },
                        );
                        return;
                      }
                    },
                    text: '동의하고 시작하기',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55,
                      color: Color(0xFF333333),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 34,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
