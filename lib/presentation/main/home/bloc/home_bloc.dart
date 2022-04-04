import 'dart:math';

import 'package:baseblocflutter/common/utils/index.dart';
import 'package:baseblocflutter/network/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/bloc_with_state.dart';
import '../../../../base/data_state.dart';
import '../../../../base/base_dialog.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;
  HomeBloc(this._homeUseCase) : super(const HomeInit()) {
    on<LoginEvent>(_login);
  }

  void _login(LoginEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    final dataState = await _homeUseCase().withProgressDialog();
    if (dataState is DataSuccess) {
      Preference.setItem(
          PreferenceConstant.token, dataState.data?.authToken ?? "");
      // emit(const HomeResults());
    } else {
      // emit(const HomeError());
    }
  }
}
