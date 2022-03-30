import 'package:baseblocflutter/common/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../base/data_state.dart';
import '../data/models/login_response.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @POST("/login")
  Future<HttpResponse<LoginResponse>> login(
    @Body() Map<String, dynamic> dataLogin,
  );
}
