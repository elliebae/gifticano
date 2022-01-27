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
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                  '1. 등록한 기프티콘이 **재판매가 불가능한 기프티콘일 경우** 법적 제재 등 불이익을 받으실 수 있습니다. (이미 사용된 기프티콘, 이중 판매한 기프티콘, 취소된 기프티콘, 조작된 기프티콘 등)\n2. 등록한 기프티콘이 검수를 통과하면 모바일상품권의 소유권은 기프티카노에 귀속됩니다. 이후 쿠폰 재판매 또는 사용할 경우 처벌의 대상이 될 수 있습니다.\n3. 등록 후 위와 같은 문제로 기프티카노에서 **협조 요청이 있을 시** 신속히 응해주셔야 합니다.\n4. 다음과 같은 **기프티콘은 반려될 수 있음**을 미리 알려드립니다. (유효기간이 짧거나 누락된 기프티콘, 이미지 해상도가 낮은 기프티콘)\n5. 사용조건이 있는 기프티콘은 반려될 수 있습니다. (사용 가능한 매장이 정해진 경우, 사용 시 본인 인증이 필요한 기프티콘, 사용기간이 정해져 있는 기프티콘)\n6. 기프티콘은 정가 기준으로 환산되며 등록한 기프티콘의 정가에서 바꾼 아메리카노 기프티콘의 정가를 차감하고 **남은 금액은 포인트로 적립**됩니다.',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText2.override(
                    fontFamily: 'Roboto',
                    lineHeight: 1.5,
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
      ),
    );
  }
}
