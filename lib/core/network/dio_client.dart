// TODO: Add `dio` to pubspec.yaml dependencies.
// dependencies:
//   dio: ^5.4.0

import 'package:app/core/constants/api_constants.dart';
import 'package:app/core/error/exceptions.dart';
import 'package:app/core/network/api_client.dart';

/// Concrete [ApiClient] implementation backed by the Dio HTTP library.
///
/// Usage:
/// ```dart
/// final client = DioClient();
/// final response = await client.get('/users');
/// ```
class DioClient implements ApiClient {
  /// Creates a [DioClient] with sensible defaults.
  ///
  /// Pass custom [baseUrl] or interceptors to override the defaults.
  DioClient({
    String? baseUrl,
    // TODO: Accept Dio instance or interceptor list once Dio is added.
    // Dio? dio,
    // List<Interceptor>? interceptors,
  }) : _baseUrl = baseUrl ?? ApiConstants.baseUrl {
    _init();
  }

  final String _baseUrl;

  // TODO: Replace with actual Dio instance.
  // late final Dio _dio;

  void _init() {
    // TODO: Initialise Dio with BaseOptions and attach interceptors.
    //
    // _dio = Dio(
    //   BaseOptions(
    //     baseUrl: _baseUrl,
    //     connectTimeout: Duration(milliseconds: ApiConstants.connectionTimeout),
    //     receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
    //     sendTimeout: Duration(milliseconds: ApiConstants.sendTimeout),
    //     headers: {
    //       ApiConstants.headerContentType: ApiConstants.contentTypeJson,
    //       ApiConstants.headerAccept: ApiConstants.contentTypeJson,
    //     },
    //   ),
    // );
    //
    // _dio.interceptors.addAll(interceptors ?? [
    //   AuthInterceptor(),
    //   LoggingInterceptor(),
    //   RetryInterceptor(),
    // ]);
  }

  // ---------------------------------------------------------------------------
  // ApiClient implementation
  // ---------------------------------------------------------------------------

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement with Dio.
    // try {
    //   final response = await _dio.get(
    //     path,
    //     queryParameters: queryParameters,
    //     options: Options(headers: headers),
    //   );
    //   return response.data;
    // } on DioException catch (e) {
    //   throw _handleError(e);
    // }
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<dynamic> uploadFile(
    String path, {
    required String filePath,
    String fileFieldName = 'file',
    Map<String, dynamic>? additionalData,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement multipart upload with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  @override
  Future<List<int>> download(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    // TODO: Implement download with Dio.
    throw UnimplementedError('Add dio dependency to use DioClient');
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Maps a Dio error to an application-level exception.
  ///
  /// TODO: Uncomment once Dio is added.
  // Exception _handleError(DioException e) {
  //   switch (e.type) {
  //     case DioExceptionType.connectionTimeout:
  //     case DioExceptionType.sendTimeout:
  //     case DioExceptionType.receiveTimeout:
  //       return const TimeoutException();
  //     case DioExceptionType.connectionError:
  //       return const NetworkException();
  //     case DioExceptionType.badResponse:
  //       return ServerException(
  //         message: e.response?.statusMessage ?? 'Server error',
  //         statusCode: e.response?.statusCode,
  //       );
  //     default:
  //       return ServerException(message: e.message ?? 'Unknown error');
  //   }
  // }
}
