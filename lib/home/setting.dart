import 'package:flutter/material.dart';
import '../common/common.dart';
import '../login/login_router.dart';
import '../res/resources.dart';
import '../routers/fluro_navigator.dart';
import '../widgets/app_bar.dart';
import '../widgets/click_column.dart';
import 'package:flustars/flustars.dart' as FlutterStars;
import '../util/utils.dart';

import 'home_router.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: MyAppBar(
          title: "设置",
        ),
        body: Container(
            color: Color(0xFFECECEC),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClickColumn(
                      title: "账号与安全",
                      onTap: () {},
                      margin: EdgeInsets.only(top: 10)),
                  ClickColumn(
                      title: "新消息通知",
                      onTap: () {},
                      margin: EdgeInsets.only(top: 10)),
                  Container(
                      height: 0.6,
                      width: double.infinity,
                      color: Colours.line,
                      margin: const EdgeInsets.only(left: 16.0)),
                  ClickColumn(title: "隐私", onTap: () {}),
                  Container(
                      height: 0.6,
                      width: double.infinity,
                      color: Colours.line,
                      margin: const EdgeInsets.only(left: 16.0)),
                  ClickColumn(title: "通用", onTap: () {}),
                  ClickColumn(
                      title: "关于mango",
                      onTap: () {
                        NavigatorUtils.push(context, HomeRouter.aboutPage);
                      },
                      margin: EdgeInsets.only(top: 10)),
                  ClickColumn(
                      title: "退出账号",
                      isbutton: true,
                      style: TextStyle(
                          color: Colors.red, fontSize: Dimens.font_sp16),
                      textAlign: TextAlign.center,
                      onTap: () {
                        openAlertDialog(
                            context: context,
                            content: "确认退出当前登录？",
                            onPressed: () {
                              FlutterStars.SpUtil.remove(Constant.access_Token);
                              NavigatorUtils.push(
                                  context, LoginRouter.loginPage);
                            });
                      },
                      margin: EdgeInsets.only(top: 10))
                ])));
  }
}
