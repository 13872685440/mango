import 'package:flutter/material.dart';
import 'package:mango/base/base_presenter.dart';
import 'package:mango/base/base_submit_state.dart';
import 'package:mango/home/home_router.dart';
import 'package:mango/provider/users/user_provider.dart';
import 'package:mango/res/resources.dart';
import 'package:mango/routers/fluro_navigator.dart';
import 'package:mango/util/image_utils.dart';
import 'package:mango/widgets/app_bar.dart';
import 'package:mango/widgets/click_column.dart';
import 'package:provider/provider.dart';

class My extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyPresenter extends BasePresenter<MyState> {}

class MyState extends BaseSubmitState<My, MyPresenter>
    with AutomaticKeepAliveClientMixin<My> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
        appBar: MyAppBar(
          title: "我",
        ),
        body: Container(
            color: Color(0xFFECECEC),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Consumer<UserProvider>(builder: (_, provider, __) {
                return Container(
                    constraints: BoxConstraints(
                        minWidth: double.infinity, //宽度尽可能大
                        minHeight: 150.0 //最小高度为50像素
                        ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    margin: EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Stack(children: <Widget>[
                          const SizedBox(width: double.infinity, height: 56.0),
                          new Text(
                            provider.user?.name,
                            style: TextStyles.textBoldDark18,
                          ),
                          Positioned(
                              right: 0.0,
                              child: CircleAvatar(
                                  radius: 28.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: getImageProvider(
                                      provider.user?.avatar,
                                      holderImg: 'user/tx'))),
                          Positioned(
                            top: 38.0,
                            left: 0.0,
                            child: Row(
                              children: <Widget>[
                                loadAssetImage("user/zz",
                                    width: 40.0, height: 16.0),
                                const Text("软件部", style: TextStyles.textDark12)
                              ],
                            ),
                          )
                        ])));
              }),
              ClickColumn(
                  title: "收藏",
                  icon: Icon(IconData(61733, fontFamily: 'Feather'),
                      color: Colors.blue),
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10)),
              Container(
                  height: 0.6,
                  width: double.infinity,
                  color: Colours.line,
                  margin: const EdgeInsets.only(left: 16.0)),
              ClickColumn(
                  title: "帮助",
                  icon: Icon(IconData(61818, fontFamily: 'Feather'),
                      color: Color(0xFFE4AE22)),
                  onTap: () {
                    NavigatorUtils.goWebViewPage(context, "帮助",
                        "https://www.yuque.com/docs/share/dd25ace6-4dea-4217-b0c6-c39fb83cebf3");
                  }),
              ClickColumn(
                  title: "设置",
                  icon: Icon(IconData(61895, fontFamily: 'Feather'),
                      color: Colors.blue),
                  onTap: () {
                    NavigatorUtils.push(context, HomeRouter.settingPage);
                  },
                  margin: EdgeInsets.only(top: 10))
            ])));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  MyPresenter createPresenter() {
    return MyPresenter();
  }
}
