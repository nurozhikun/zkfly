import 'package:dio/dio.dart';
import 'fly_request_api.dart';

class DioRequest implements FlyRequest {
  final dio;
  DioRequest() : dio = Dio();
}
