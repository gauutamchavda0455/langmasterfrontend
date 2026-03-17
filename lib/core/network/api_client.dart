/// Abstract contract for an HTTP client used by repositories.
///
/// Implementations can wrap Dio, http, or any other HTTP package.
/// This keeps the data layer decoupled from a specific networking library.
abstract class ApiClient {
  /// Performs an HTTP GET request.
  ///
  /// [path] is appended to the base URL.
  /// [queryParameters] are encoded as URL query params.
  /// [headers] are merged with the default headers.
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Performs an HTTP POST request.
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Performs an HTTP PUT request.
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Performs an HTTP PATCH request.
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Performs an HTTP DELETE request.
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// Uploads a file via multipart/form-data POST.
  ///
  /// [filePath] is the absolute path on disk.
  /// [fileFieldName] is the form field name expected by the server.
  Future<dynamic> uploadFile(
    String path, {
    required String filePath,
    String fileFieldName = 'file',
    Map<String, dynamic>? additionalData,
    Map<String, String>? headers,
  });

  /// Downloads a file and returns the raw bytes.
  Future<List<int>> download(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
