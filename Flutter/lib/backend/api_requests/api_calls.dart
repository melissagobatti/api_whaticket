import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start WhatsApp Group Code

class WhatsAppGroup {
  static String baseUrl = 'https://api.melissatreinamentos.tec.br/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer seutokenaqui',
  };
  static MessageCall messageCall = MessageCall();
  static FileCall fileCall = FileCall();
}

class MessageCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "number": "55$number",
  "body": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Message',
      apiUrl: '${WhatsAppGroup.baseUrl}/api/messages/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer seutokenaqui',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  String? mensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mensagem''',
      ));
}

class FileCall {
  Future<ApiCallResponse> call({
    String? number = '',
    FFUploadedFile? medias,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'File',
      apiUrl: '${WhatsAppGroup.baseUrl}/api/messages/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer seutokenaqui',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'number': number,
        'medias': medias,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WhatsApp Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
