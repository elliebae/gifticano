import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../input_coupon/input_coupon_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangeAgreementWidget extends StatefulWidget {
  const ExchangeAgreementWidget({Key key}) : super(key: key);

  @override
  _ExchangeAgreementWidgetState createState() =>
      _ExchangeAgreementWidgetState();
}

class _ExchangeAgreementWidgetState extends State<ExchangeAgreementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x70707070),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: SingleChildScrollView(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 10),
                    child: Text(
                      '기프티콘 등록시 유의사항',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '1. 등록한 기프티콘이 재판매가 불가능한 기프티콘일 경우 법적 제재 등 불이익을 받을 수 있습니다.\n\n2. 다음과 같은 기프티콘은 반려될 수 있습니다.\n- 유효기간이 짧거나 누락된 기프티콘\n- 이미지 해상도가 낮은 기프티콘\n- 사용 가능한 매장이 정해진 경우\n- 사용 시 본인 인증이 필요한 기프티콘\n\n3. 거스름돈은 포인트로 적립됩니다.',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Roboto',
                      lineHeight: 1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://sites.google.com/view/gifticano-agreement-exchange');
                      },
                      child: Text(
                        '자세히 보기',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.customColor2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 34),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputCouponWidget(),
                      ),
                          (r) => false,
                    );
                  },
                  text: '동의하고 등록하기',
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
              ),
            ],
          ),
        )
      ),
    );
  }
}

