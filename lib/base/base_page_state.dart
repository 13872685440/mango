import 'package:flutter/material.dart';
import '../base/base_presenter.dart';
import '../routers/fluro_navigator.dart';
import '../util/toast.dart';
import '../util/utils.dart';
import '../widgets/progress_dialog.dart';

import 'loads.dart';

abstract class BasePageState<T extends StatefulWidget, V extends BasePresenter>
    extends State<T> implements ILoadView {
  V presenter;

  BasePageState() {
    presenter = createPresenter();
    presenter.view = this;
  }

  V createPresenter();

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      NavigatorUtils.goBack(context);
    }
  }

  bool _isShowDialog = false;

  @override
  void showProgress() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showTransparentDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async {
                  // 拦截到返回键，证明dialog被手动关闭
                  _isShowDialog = false;
                  presenter?.cancelToken();
                  return Future.value(true);
                },
                child: ProgressDialog(hintText: "正在加载..."),
              );
            });
      } catch (e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        print(e);
      }
    }
  }

  @override
  void showToast(String string) {
    Toast.show(string);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    presenter?.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    presenter?.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    presenter?.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    didUpdateWidgets<T>(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    presenter?.initState();
  }

  void didUpdateWidgets<W>(W oldWidget) {
    presenter?.didUpdateWidgets<W>(oldWidget);
  }
}
