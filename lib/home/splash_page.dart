import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mango/common/common.dart';
import 'package:mango/login/login_router.dart';
import 'package:mango/models/index.dart';
import 'package:mango/net/net.dart';
import 'package:mango/provider/users/user_provider.dart';
import 'package:mango/routers/fluro_navigator.dart';
import 'package:mango/util/toast.dart';
import 'package:mango/util/utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flustars/flustars.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initAsync() async {
    await SpUtil.getInstance();

    String token = SpUtil.getString(Constant.access_Token);
    if (token.isNotEmpty) {
      _goHome();
    } else {
      _goLogin();
    }
    //if (SpUtil.getBool(Constant.key_guide, defValue: true)) {
    // SpUtil.putBool(Constant.key_guide, false);
    // _goLogin();
    // _initGuide();
    //} else {
    //  _goLogin();
    //}
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 2000)).listen((_) {
      _initAsync();
    });
  }

  _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
  }

  _goHome() async {
    await DioUtils.instance.request(Method.get, "info/user", params: {},
        onSuccess: (data) {
      User_bean_info a = User_bean_info.fromJson(data);
      DioUtils.instance.request(Method.post, "info/app_router",
          params: {"userRoles": a.userRoles}, onSuccess: (data) {
        a.apps = List();
        for (var item in data) {
          Apptree app = Apptree.fromJson(item);
          a.apps.add(app);
        }
        Provider.of<UserProvider>(context).setUser(a);
        NavigatorUtils.push(context, LoginRouter.homePage, replace: true);
      }, onError: (code, msg) {
        LogUtil.e(msg);
        Toast.show("应用加载失败");
        Future.delayed(Duration(seconds: 1)).then((_) {
          Utils.pop();
        });
      });
    }, onError: (code, msg) {
      LogUtil.e(msg);
      if (code == ExceptionHandle.unauthorized) {
        // 如果是未认证，将token清空，返回到登录页
        SpUtil.remove(Constant.access_Token);
        NavigatorUtils.push(context, LoginRouter.loginPage);
        Toast.show(msg + "，请重新登录");
      } else {
        Toast.show(msg);
        Future.delayed(Duration(seconds: 1)).then((_) {
          Utils.pop();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Image.asset(
            Utils.getImgPath("start_page", format: "jpg"),
            width: double.infinity,
            fit: BoxFit.fill,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
