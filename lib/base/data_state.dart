import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioError? error;
  final String? state;
  const DataState({this.data, this.error, this.state});
}

/// Return state when call api success
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data, String state) : super(data: data, state: state);
}

/// Return state when call api error
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);
}
