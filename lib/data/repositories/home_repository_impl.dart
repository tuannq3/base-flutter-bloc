import 'dart:convert';
import 'dart:io';

import 'package:baseblocflutter/base/data_state.dart';
import 'package:baseblocflutter/network/home_api.dart';
import 'package:dio/dio.dart';

import '../../base/base_data.dart';
import '../../network/repositories/home_repository.dart';
import '../models/login_response.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApi _homeApi;
  HomeRepositoryImpl(this._homeApi);
  @override
  Future<DataState<LoginResponse>> login(Map<String, dynamic> dataLogin) async {
    try {
      final httpResponse = await _homeApi.login(dataLogin);
      return DataSuccess(
        httpResponse.data,
        (httpResponse.response.data as Map)["status"] as String,
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
