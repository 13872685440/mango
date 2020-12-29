import 'dart:async';

import 'package:flutter/material.dart';
import '../common/common.dart';
import '../login/login_router.dart';
import '../models/index.dart';
import '../net/net.dart';
import '../provider/users/user_provider.dart';
import '../routers/fluro_navigator.dart';
import '../util/toast.dart';
import '../util/utils.dart';
import 'package:provider/provider.dart';
import 'package:flustars/flustars.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
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
    Future.delayed(new Duration(milliseconds: 2000), () {
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
        Provider.of<UserProvider>(context,listen: false).setUser(a);
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
