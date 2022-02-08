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
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  alignment: AlignmentDirectional(-1, 0),
                  child: InkWell(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('등록을 취소할까요?'),
                            content: Text('언제든 다시 등록할 수 있어요.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('등록할래요'),
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
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/images/back-icon.png',
                      height: 30,
                      fit: BoxFit.fitHeight,
                    ),
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
                  width: 50,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  alignment: AlignmentDirectional(1, 0),
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
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                final downloadUrl = await uploadData(
                                    selectedMedia.storagePath,
                                    selectedMedia.bytes);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(() => uploadedFileUrl = downloadUrl);
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  showUploadMessage(
                                    context,
                                    'Failed to upload media',
                                  );
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
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('기프티콘을 아메리카노로 바꿀까요?'),
                                      content: Text('언제든 다시 등록할 수 있어요.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('아니요'),
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
                                              sellingStatus: 'stock',
                                            );
                                            await GifticonsRecord.collection
                                                .doc()
                                                .set(gifticonsCreateData);
                                            ;
                                          },
                                          child: Text('등록할게요'),
                                        ),
                                      ],
                                    );
                                  },
                                );
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
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('메인 화면으로 갈래요'),
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
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                        child: Text(
                          '등록한  기프티콘이  기억이 안난다면? >',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.bodyText1,
                        ),
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
