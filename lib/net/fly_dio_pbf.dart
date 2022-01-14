// import 'package:protobuf/protobuf.dart' as $pb;
import 'package:dio/dio.dart';

class FlyDioPbf {
  final Dio dio;
  FlyDioPbf(BaseOptions? opt) : dio = Dio(opt);
}
