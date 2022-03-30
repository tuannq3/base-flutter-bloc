import 'package:baseblocflutter/base/data_state.dart';
import 'package:baseblocflutter/base/usecase.dart';
import 'package:baseblocflutter/data/models/login_response.dart';
import 'package:baseblocflutter/network/repositories/home_repository.dart';

class HomeUseCase implements UseCase<DataState<LoginResponse>, dynamic> {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<DataState<LoginResponse>> call({params}) {
    return _repository.login({"user": "ngant2", "password": "Thiennga937"});
  }
}
