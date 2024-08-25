import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../index.dart';

class WPHttpService extends GetxService {
  static WPHttpService get to => Get.find();

  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();

    // 初始化 Dio
    var options = BaseOptions(
      baseUrl: Constants.wpApiBaseUrl,
      connectTimeout: const Duration(seconds: 10000), // 10秒
      receiveTimeout: const Duration(seconds: 5000), // 5秒
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options);

    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

/// 拦截器
class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);
    // if (UserService.to.hasToken) {
    //   options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    // }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 200 请求成功, 201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final exception = HttpException(err.message ?? '');

    DioException newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: exception, // 将新错误信息传递给新的 DioException
    );

    switch (err.type) {
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        {
          // 处理响应相关的错误
        }
        break;
      case DioExceptionType.unknown:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      default:
        break;
    }

    handler.next(newError);
  }
}
