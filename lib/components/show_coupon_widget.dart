import 'dart:ffi';

import 'package:gifticano/auth/auth_util.dart';
import 'package:gifticano/auth/firebase_user_provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

Future<Gifticano> fetchGifticano() async {
  final response = await http.post(
      Uri.parse('https://us-central1-gifticano-74f3e.cloudfunctions.net/gifticano/first-gifticano'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': currentUserDocument.uid,
      },)
  );

  if (response.statusCode == 200) {
    print('^^^^^');
    print(Gifticano.fromJson(json.decode(response.body)).id);
    print(response.body);
    return Gifticano.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load gifticano');
  }
}

Future<Gifticano> updateGifticano(Gifticano gifticano) async {
  final response = await http.post(
    Uri.parse('https://us-central1-gifticano-74f3e.cloudfunctions.net/gifticano/used'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userId': currentUserDocument.uid,
      'gifticanoId': gifticano.id,
    }),
  );
  print('---');
  print(currentUserDocument.uid);
  print(gifticano.id);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return Gifticano.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update gifticano');
  }
}

class Gifticano {
  final String id;
  final String barcodeImageUrl;
  final String validDate;
  final String barcodeNumber;

  Gifticano({this.id, this.barcodeImageUrl, this.validDate, this.barcodeNumber});

  factory Gifticano.fromJson(Map<String, dynamic> json) {
    return Gifticano(
      id: json['id'],
      barcodeImageUrl: json['barcodeImageUrl'],
      validDate: json['validDate'],
      barcodeNumber: json['barcodeNumber'],
    );
  }
}

class ShowCouponWidget extends StatefulWidget {
  const ShowCouponWidget({Key key}) : super(key: key);

  @override
  _ShowCouponWidgetState createState() => _ShowCouponWidgetState();
}

class _ShowCouponWidgetState extends State<ShowCouponWidget> {

  Future<Gifticano> gifticano;

  //혹시 모르니 지울 것
  @override
  void initState(){
    super.initState();
    gifticano = fetchGifticano();
  }
  //


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Gifticano> (
        future: gifticano,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 1,
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 10),
                              child: Image.network(
                                snapshot.data.barcodeImageUrl,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text(
                              '유효 기간 : ${snapshot.data.validDate}',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                            // Generated code for this Button Widget...
                            if (snapshot.data.barcodeNumber != null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  print('눌림');
                                  print(snapshot.data.barcodeNumber);
                                  final barcode = ClipboardData(text: snapshot.data.barcodeNumber);
                                  print("get barcode");
                                  Clipboard.setData(barcode);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '클립보드에 복사되었어요!',
                                        style: FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: FlutterFlowTheme.secondaryColor,
                                    ),
                                  );
                                },
                                text: '바코드 복사',
                                icon: Icon(
                                  Icons.file_copy_rounded,
                                  size: 16,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 25,
                                  color: Color(0xFFF2F3F2),
                                  textStyle: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF666666),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 10,
                                ),
                              ),
                            )

                          ],
                        )
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
                          onPressed: () =>
                              showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('기프티콘을 사용하셨나요?'),
                                      content: Text(
                                          '사용완료를 누르시면 다시 사용하실 수 없습니다.'),
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
                                            print('%%%%');
                                            print(snapshot.data);
                                            print(snapshot.data.id);
                                            updateGifticano(snapshot.data).whenComplete(() => Navigator.pop(context));
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
          } else {
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
        }
      );
    }
  }