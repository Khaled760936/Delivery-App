abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    
  });
  patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    
  });
  delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    
  });
}
