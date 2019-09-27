import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:mango/base/base_page_state.dart';
import 'package:mango/base/base_presenter.dart';
import 'package:mango/common/common.dart';
import 'package:mango/models/index.dart';
import 'package:mango/net/api.dart';
import 'package:mango/provider/users/user_provider.dart';
import 'package:mango/res/resources.dart';
import 'package:mango/routers/fluro_navigator.dart';
import 'package:mango/util/toast.dart';
import 'package:mango/util/utils.dart';
import 'package:mango/widgets/app_bar.dart';
import 'package:mango/widgets/my_button.dart';
import 'package:mango/widgets/text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';

import 'login_router.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class LoginPresenter extends BasePresenter<_LoginState> {}

class _LoginState extends BasePageState<Login, LoginPresenter> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  KeyboardActionsConfig _config;
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    _nameController.text = FlutterStars.SpUtil.getString(Constant.user_Name);
    // _nameController.text = FlutterStars.SpUtil.getString(Constant.phone);
    _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2]);
  }

  void _verify() {
    String name = _nameController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty) {
      isClick = false;
    }
    if (password.isEmpty) {
      isClick = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (isClick != _isClick) {
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _login() async {
    // showProgress();
    FlutterStars.SpUtil.putString(Constant.user_Name, _nameController.text);
    dynamic params = {
      "service": "flutterLoginService",
      "username": _nameController.text,
      "password": Utils.generateMd5(Utils.generateMd5(_passwordController.text))
    };
    await presenter.request(Method.post, url: "auth/login", params: params,
        onSuccess: (data) {
      User_info a = User_info.fromJson(data);
      FlutterStars.SpUtil.putString(Constant.user_Name, a.username);
      FlutterStars.SpUtil.putString(Constant.access_Token, a.token);
      FlutterStars.SpUtil.putObject(Constant.user_Info, a);
      presenter.request(Method.get, url: "info/user", params: {},
          onSuccess: (data) {
        User_bean_info a = User_bean_info.fromJson(data);
        presenter.request(Method.post,
            url: "info/app_router",
            params: {"userRoles": a.userRoles}, onSuccess: (data) {
          a.apps = List();
          for (var item in data) {
            Apptree app = Apptree.fromJson(item);
            a.apps.add(app);
          }
          Provider.of<UserProvider>(context).setUser(a);
          NavigatorUtils.push(context, LoginRouter.homePage);
        }, onError: (code, msg) {
          LogUtil.e(msg);
          Toast.show("应用加载失败");
        });
      }, onError: (code, msg) {
        LogUtil.e(msg);
      });
    }, onError: (code, msg) {
      LogUtil.e(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _isExit,
        child: Scaffold(
            appBar: MyAppBar(isBack: false),
            body: defaultTargetPlatform == TargetPlatform.iOS
                ? FormKeyboardActions(
                    child: _buildBody(),
                  )
                : SingleChildScrollView(
                    child: _buildBody(),
                  )));
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "密码登录",
            style: TextStyles.textBoldDark26,
          ),
          Gaps.vGap16,
          MyTextField(
              focusNode: _nodeText1,
              controller: _nameController,
              keyboardType: TextInputType.text,
              hintText: "请输入账号"),
          Gaps.vGap10,
          MyTextField(
              focusNode: _nodeText2,
              config: _config,
              isInputPwd: true,
              controller: _passwordController,
              hintText: "请输入密码"),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _isClick ? _login : null,
            text: "登录",
          )
        ],
      ),
    );
  }

  @override
  LoginPresenter createPresenter() {
    return LoginPresenter();
  }

  Future<bool> _isExit() {
    return Utils.pop();
  }
}
