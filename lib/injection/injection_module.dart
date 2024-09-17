
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/http_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule{

  @singleton
  Dio get dio => Dio()..interceptors.add(PrettyDioLogger());


}