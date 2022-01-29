import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../name/name_widget.dart';
import '../phone_number/phone_number_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberVerifyWidget extends StatefulWidget {
  const PhoneNumberVerifyWidget({
    Key key,
    this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  _PhoneNumberVerifyWidgetState createState() =>
      _PhoneNumberVerifyWidgetState();
}

class _PhoneNumberVerifyWidgetState extends State<PhoneNumberVerifyWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 56, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneNumberWidget(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/back-icon.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 19),
                                child: Text(
                                  '문자로 전송된\n인증번호를 입력해주세요.',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6, 0, 6, 0),
                                  child: TextFormField(
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: '6자리',
                                      hintStyle:
                                          FlutterFlowTheme.title3.override(
                                        fontFamily: 'Noto Sans',
                                        color: Color(0xFF999999),
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF999999),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF999999),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      suffixIcon: textController.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () => setState(
                                                () => textController.clear(),
                                              ),
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF999999),
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Noto Sans',
                                      color: Color(0xFF999999),
                                      fontSize: 36,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return '필수 입력란입니다';
                                      }

                                      return null;
                                    },
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
                        if (!formKey.currentState.validate()) {
                          return;
                        }
                        if (textController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enter SMS verification code.'),
                            ),
                          );
                          return;
                        }
                        final phoneVerifiedUser = await verifySmsCode(
                          context: context,
                          smsCode: textController.text,
                        );
                        if (phoneVerifiedUser == null) {
                          return;
                        }
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NameWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: '다음',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 18,
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
                width: 100,
                height: 34,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
