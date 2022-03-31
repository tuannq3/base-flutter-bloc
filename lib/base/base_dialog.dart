import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class BaseDialog {
  bool _isShow = false;
  bool _allowShowMultiDialog = false;

  void showLoading() {
    _isShow = true;
    if (_isShow && !_allowShowMultiDialog) {
      hideDialog();
    }
    SmartDialog.showLoading();
  }

  void showMessage(String message) {
    _isShow = true;
    if (_isShow && !_allowShowMultiDialog) {
      hideDialog();
    }
    SmartDialog.show(
      widget: Container(
        width: 1.sw,
        color: Colors.white,
        child: Text(message),
      ),
    );
  }

  void hideDialog() {
    SmartDialog.dismiss();
  }

  bool isShowing() {
    return _isShow;
  }

  void setAllowShowMultiDialog(bool allowShowMultiDialog) {
    this._allowShowMultiDialog = allowShowMultiDialog;
  }
}
