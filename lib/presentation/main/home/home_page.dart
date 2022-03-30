import 'package:baseblocflutter/base/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../injector.dart';
import 'bloc/home_bloc.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);
  final _homeBloc = injector.get<HomeBloc>();
  final GlobalKey _keyTextField = GlobalKey(debugLabel: 'hihi');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: BlocProvider(
        create: (_) => injector<HomeBloc>(),
        child: Scaffold(
          body: BlocConsumer<HomeBloc, HomeState>(
            bloc: _homeBloc,
            buildWhen: (pre, current) {
              if (current is HomeLoading) {
                return false;
              }
              return true;
            },
            listenWhen: (pre, current) {
              return true;
            },
            listener: (event, state) {
              if (state is HomeLoading) {
                injector<BaseDialog>().showLoading();
              } else if (state is HomeError) {
                injector<BaseDialog>().showMessage("Lỗi r");
              } else {
                injector<BaseDialog>().hideDialog();
              }
            },
            builder: (event, state) {
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('-'),
                  ),
                  const Text(
                    '1',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: TextField(key: _keyTextField),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _homeBloc.add(const LoginEvent());
                    },
                    child: const Text('+'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
