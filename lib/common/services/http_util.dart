import 'package:dio/dio.dart';
import 'package:freefish/common/utils/app_constants.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverApiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        ErrorEntity errorInfo = createErrorEntity(e);
        onError(errorInfo);
      },
    ));
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var token = Global.storageService.getUserToken();
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    requestOptions.headers!.addAll(getAuthorizationHeader());

    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    print("get url: $url");
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    requestOptions.headers!.addAll(getAuthorizationHeader());
    Response response = await dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response;
  }
}

class ErrorEntity implements Exception {
  int code;
  String message;

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    return "ErrorEntity{code: $code, message: $message}";
  }
}

createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timeout");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timeout");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timeout");
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Request cancelled");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad certificate");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 401:
          return ErrorEntity(code: 401, message: "Unauthorized");
        case 403:
          return ErrorEntity(code: 403, message: "Forbidden");
        case 404:
          return ErrorEntity(code: 404, message: "Not found");
        case 405:
          return ErrorEntity(code: 405, message: "Method not allowed");
        case 500:
          return ErrorEntity(code: 500, message: "Internal server error");
        case 502:
          return ErrorEntity(code: 502, message: "Bad gateway");
        case 503:
          return ErrorEntity(code: 503, message: "Service unavailable");
        case 505:
          return ErrorEntity(code: 505, message: "HTTP version not supported");
        default:
          return ErrorEntity(code: -1, message: "Bad response");
      }

    case DioExceptionType.unknown:
      try {
        int? errCode = error.response?.statusCode;
        String? errMsg = error.response?.statusMessage;
        return ErrorEntity(code: errCode ?? -1, message: errMsg ?? "");
      } on Exception catch (_) {
        return ErrorEntity(code: -1, message: "Unknown error");
      }
  }
}

void onError(ErrorEntity errorEntity) {
  switch (errorEntity.code) {
    case 400:
      toastInfo(msg: "Bad request");
      break;
    case 401:
      toastInfo(msg: "Unauthorized");
      break;
    case 403:
      toastInfo(msg: "Forbidden");
      break;
    case 404:
      toastInfo(msg: "Not found");
      break;
    case 405:
      toastInfo(msg: "Method not allowed");
      break;
    case 500:
      toastInfo(msg: "Internal server error");
      break;
    case 502:
      toastInfo(msg: "Bad gateway");
      break;
    case 503:
      toastInfo(msg: "Service unavailable");
      break;
    case 505:
      toastInfo(msg: "HTTP version not supported");
      break;
    default:
      toastInfo(msg: "Unknown error");
      break;
  }
}
