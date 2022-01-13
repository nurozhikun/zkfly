import 'fly_request_dio.dart';

abstract class FlyRequest {
  static FlyRequest? _req;
  factory FlyRequest() {
    _req ??= DioRequest();
    return _req!;
  }
}
