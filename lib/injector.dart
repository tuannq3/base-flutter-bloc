import 'package:baseblocflutter/base/base_dialog.dart';
import 'package:baseblocflutter/common/utils/index.dart';
import 'package:baseblocflutter/main.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'common/config/pretty_dio_logger.dart';
import 'data/repositories/home_repository_impl.dart';
import 'network/home_api.dart';
import 'network/repositories/home_repository.dart';
import 'network/usecase/home_usecase.dart';
import 'presentation/main/home/bloc/home_bloc.dart';

GetIt injector = GetIt.asNewInstance();
Dio? dio;
Dio getDio() {
  if (dio == null) {
    dio = Dio();
    dio?.options.headers['content-Type'] = 'application/json';
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
  return dio!;
}

Future<void> initInjector() async {
  // Dio client
  injector.registerSingleton<Dio>(getDio());

  // Dependencies
  injector.registerSingleton<HomeApi>(HomeApi(injector()));

  //Repository
  injector.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(injector()),
  );

  //UseCases
  injector.registerSingleton<HomeUseCase>(HomeUseCase(injector()));

  //Bloc
  // injector.registerFactory<AppBloc>(() => AppBloc());
  injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));

  //Dialog
  injector.registerFactory<BaseDialog>(() => BaseDialog());

  // Preference
}
