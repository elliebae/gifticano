import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../history/history_widget.dart';
import '../main/main_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCouponWidget extends StatefulWidget {
  const InputCouponWidget({Key key}) : super(key: key);

  @override
  _InputCouponWidgetState createState() => _InputCouponWidgetState();
}

class _InputCouponWidgetState extends State<InputCouponWidget> {
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF2F3F2),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 43),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('등록을 취소할까요?'),
                          content: Text('언제든 다시 등록할 수 있어요.'),
                          //예쁘게
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          //
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('등록할래요'),
                              //예쁘게
                              style: TextButton.styleFrom(
                                primary: Color(0xFF666666), //글자
                                backgroundColor: Color(0xFFF2F3F2),
                                padding: EdgeInsets.all(10.0),
                                minimumSize: Size(135, 55), //최소 사이즈
                                shape:
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                              ),
                              //
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(alertDialogContext);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainWidget(),
                                  ),
                                );
                                ;
                              },
                              child: Text('취소할게요'),
                              //예쁘게
                              style: TextButton.styleFrom(
                                primary: Colors.white, //글자
                                backgroundColor: Color(0xFFE15241),
                                padding: EdgeInsets.all(10.0),
                                minimumSize: Size(135, 55), //최소 사이즈
                                shape:
                                StadiumBorder(), // : 각진버튼, CircleBorder : 동그라미버튼, StadiumBorder : 모서리가 둥근버튼,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/back-icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '기프티콘 등록',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 30,
                  height: MediaQuery.of(context).size.height * 0.13,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.77,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0xFFB3B3B3),
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(32, 20, 32, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                              );
                              if (selectedMedia != null &&
                                  validateFileFormat(
                                      selectedMedia.storagePath, context)) {
                                showUploadMessage(context, '사진 업로드 하는 중...',
                                    showLoading: true);
                                final downloadUrl = await uploadData(
                                    selectedMedia.storagePath,
                                    selectedMedia.bytes);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(() => uploadedFileUrl = downloadUrl);
                                  showUploadMessage(context, '성공적으로 업로드 되었습니다!');
                                } else {
                                  showUploadMessage(
                                      context, '업로드에 실패했습니다');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.54,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(
                                    'assets/images/add-photo.png',
                                  ).image,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  uploadedFileUrl,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '변경하려면 사진을 터치해주세요.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (uploadedFileUrl.isEmpty) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('이미지가 업로드 되지 않았습니다.'),
                                        content: Text('기프티콘 이미지를 등록해주세요.'),
                                        //예쁘게
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        //
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(alertDialogContext),
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
                                          )
                                        ]
                                      );
                                    }
                                  );
                                  return;
                                }
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('기프티콘을 아메리카노로 바꿀까요?'),
                                      content: Text('언제든 다시 등록할 수 있어요.'),
                                      //예쁘게
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      //
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('아니요'),
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
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(alertDialogContext);

                                            final gifticonsCreateData =
                                                createGifticonsRecordData(
                                              userId: currentUserReference,
                                              status: 'waiting',
                                              price: 0,
                                              failReason: '',
                                              uploadedAt: getCurrentTimestamp,
                                              imageURL: uploadedFileUrl,
                                              barcodeNumber:
                                                    functions.returnEmptyString(),
                                            );
                                            await GifticonsRecord.collection
                                                .doc()
                                                .set(gifticonsCreateData);

                                            final usersUpdateData = {
                                              'checkingGifticonNum':
                                              FieldValue.increment(1),
                                            };
                                            await currentUserReference
                                                .update(usersUpdateData);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('기프티콘이 등록되었습니다.'),
                                                  content: Text(
                                                      '검수를 마친 후 문자를 보내드릴게요. 검수에 통과하면 자동으로 등록하신 기프티콘을 아메리카노로 바꿔드려요.'),
                                                  //예쁘게
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                                  ),
                                                  //
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(alertDialogContext),
                                                      child: Text('메인 화면으로 갈래요'),
                                                      //예쁘게
                                                      style: TextButton.styleFrom(
                                                        primary: Color(0xFFFFFFFF), //글자
                                                        backgroundColor: Color(0xFF3D8566),
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
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MainWidget(),
                                              ),
                                                  (r) => false,
                                            );
                                          },
                                          child: Text('등록할게요'),
                                          //예쁘게
                                          style: TextButton.styleFrom(
                                            primary: Color(0xFFFFFFFF), //글자
                                            backgroundColor: Color(0xFF3D8566),
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
                              },
                              text: '기프티콘 등록하기',
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
                                borderRadius: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryWidget(),
                          ),
                        );
                      },
                      child: Text(
                        '등록한  기프티콘이  기억이 안난다면? >',
                        style: FlutterFlowTheme.bodyText1,
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
  }
}
