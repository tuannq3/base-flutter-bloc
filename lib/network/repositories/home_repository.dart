import '../../base/data_state.dart';
import '../../data/models/login_response.dart';

abstract class HomeRepository {
  Future<DataState<LoginResponse>> login(Map<String, dynamic> dataLogin);
}
