import 'package:dio/dio.dart';
import 'package:mango/base/i_presenter.dart';
import 'package:mango/base/loads.dart';
import 'package:mango/net/net.dart';
import 'package:meta/meta.dart';

class BasePresenter<V extends ILoadView> extends IPresenter {
  V view;

  CancelToken _cancelToken;

  BasePresenter() {
    _cancelToken = CancelToken();
  }

  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidgets<W>(W oldWidget) {}

  @override
  void dispose() {
    /// 销毁时，将请求取消
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel();
    }
  }

  @override
  void initState() {}

  Future request<T>(Method method,
      {@required String url,
      bool isShow: true,
      bool isClose: true,
      Function(T t) onSuccess,
      Function(int code, String mag) onError,
      dynamic params,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Options options}) async {
    if (isShow) view.showProgress();
    await DioUtils.instance.request<T>(method, url,
        params: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? _cancelToken, onSuccess: (data) {
      if (isClose) view.closeProgress();
      if (onSuccess != null) {
        onSuccess(data);
      }
    }, onError: (code, msg) {
      print(code);
      _onError(code, msg, onError);
    });
  }

  _onError(int code, String msg, Function(int code, String mag) onError) {
    /// 异常时直接关闭加载圈，不受isClose影响
    view.closeProgress();
    if (code != ExceptionHandle.cancel_error) {
      view.showToast(msg);
    }

    /// 页面如果dispose，则不回调onError
    if (onError != null && view.getContext() != null) {
      onError(code, msg);
    }
  }

  void cancelToken() {
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel();
      _cancelToken = CancelToken();
    }
  }
}
