import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class BaseView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return vBuilder();
  }

  Widget vBuilder();
}
