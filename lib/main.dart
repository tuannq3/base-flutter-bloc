import 'package:baseblocflutter/injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'base/bloc_with_state.dart';
import 'common/config/app_theme.dart';
import 'presentation/main/home/bloc/home_bloc.dart';
import 'presentation/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => injector.get<AppBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getLight(),
          routeInformationParser: getRoute().routeInformationParser,
          routerDelegate: getRoute().routerDelegate,
          builder: FlutterSmartDialog.init(),
        ),
      ),
    );
  }
}

class AppBloc extends BlocWithState<AppEvent, AppState> {
  AppBloc() : super(AppState());
}

class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Bloc) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
