import 'dart:math';

import 'package:baseblocflutter/network/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/bloc_with_state.dart';
import '../../../../base/data_state.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;
  HomeBloc(this._homeUseCase) : super(const HomeInit()) {
    on<LoginEvent>(_login);
  }

  void _login(LoginEvent event, Emitter<HomeState> emit) async {
    print(event);
    emit(const HomeLoading());
    final dataState = await _homeUseCase();
    if (dataState is DataSuccess) {
      emit(const HomeResults());
    } else {
      emit(const HomeError());
    }
  }
}
