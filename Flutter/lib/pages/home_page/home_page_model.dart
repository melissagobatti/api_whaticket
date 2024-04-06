import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  String? Function(BuildContext, String?)? celularControllerValidator;
  // State field(s) for Mensagem widget.
  FocusNode? mensagemFocusNode;
  TextEditingController? mensagemController;
  String? Function(BuildContext, String?)? mensagemControllerValidator;
  // Stores action output result for [Backend Call - API (Message)] action in btEnviar widget.
  ApiCallResponse? apiResultMessage;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (File)] action in Button widget.
  ApiCallResponse? apiResulto2h;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    celularFocusNode?.dispose();
    celularController?.dispose();

    mensagemFocusNode?.dispose();
    mensagemController?.dispose();
  }
}
