import 'package:flutter/material.dart';
import '../base/base_presenter.dart';
import '../base/base_submit_state.dart';
import '../models/index.dart';
import '../provider/users/user_provider.dart';
import '../res/resources.dart';
import '../widgets/app_bar.dart';
import '../widgets/app_item.dart';
import 'package:provider/provider.dart';

class WorkSpace extends StatefulWidget {
  @override
  _WorkSpaceState createState() => _WorkSpaceState();
}

class WorkSpaceresenter extends BasePresenter<_WorkSpaceState> {}

class _WorkSpaceState extends BaseSubmitState<WorkSpace, WorkSpaceresenter>
    with SingleTickerProviderStateMixin {
  bool isOff = false;
  String hideText = "收起";

  void onButtonClickListener() {
    setState(() {
      isOff = !isOff;
      if (isOff) {
        hideText = "展开";
      } else {
        hideText = "收起";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "工作台",
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Flex(direction: Axis.horizontal, children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: Column(children: <Widget>[
                        Text("常用应用",
                            style: TextStyles.textDark16,
                            textAlign: TextAlign.start)
                      ])),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          child: Column(children: <Widget>[
                        Text("",
                            style: TextStyles.textDark16,
                            textAlign: TextAlign.start)
                      ])),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: Column(children: <Widget>[
                        GestureDetector(
                            child: Text(
                              hideText,
                              style: TextStyles.textDark16,
                              textAlign: TextAlign.start,
                            ),
                            onTap: onButtonClickListener)
                      ])),
                    )
                  ])),
              _bulidappbodyshow(),
              _bulidappbodyhide(),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                  child: Flex(direction: Axis.horizontal, children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: Column(children: <Widget>[
                        Text("我的任务",
                            style: TextStyles.textDark16,
                            textAlign: TextAlign.start)
                      ])),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          child: Column(children: <Widget>[
                        Text("",
                            style: TextStyles.textDark16,
                            textAlign: TextAlign.start)
                      ])),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: Column(children: <Widget>[
                        GestureDetector(
                            child: Text(
                              "",
                              style: TextStyles.textDark16,
                              textAlign: TextAlign.start,
                            ),
                            onTap: onButtonClickListener)
                      ])),
                    )
                  ]))
            ]));
  }

  @override
  void initState() {
    super.initState();
    inidata();
  }

  void inidata() {
    //_bulidappbody();
  }

  Widget _bulidappbodyshow() {
    User_bean_info a = Provider.of<UserProvider>(context).user;
    List<Apptree> apps = a?.apps;
    List<Widget> as = List();
    if (apps.isNotEmpty) {
      for (var i = 0; i < 4; i++) {
        _buildcol(as, i, apps);
      }
    }
    return Flex(direction: Axis.horizontal, children: as);
  }

  Widget _bulidappbodyhide() {
    User_bean_info a = Provider.of<UserProvider>(context).user;
    List<Apptree> apps = a?.apps;
    List<Widget> as = List();
    if (apps.isNotEmpty) {
      if (apps.length > 4) {
        int j = apps.length % 4;
        for (var i = 0; i < j; i++) {
          List<Widget> aschild = List();
          for (var k = 0; k < 4; k++) {
            int z = (i + 1) * 4 + k;
            _buildcol(aschild, z, apps);
          }
          as.add(Padding(
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              child: Flex(direction: Axis.horizontal, children: aschild)));
        }
      }
    }
    return Offstage(
        offstage: isOff,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: as));
  }

  List<Widget> _buildcol(List<Widget> as, i, List<Apptree> apps) {
    if (i >= apps.length) {
      as.add(AppItem(title: "", path: ""));
    } else {
      Apptree app = apps[i];
      as.add(AppItem(
        title: app.title,
        path: app.path,
        key: Key(app.code),
        fontCode: app.fontCode,
        fontFamily: app.fontFamily,
        color: Color(int.parse(app.colorCode)),
      ));
    }
    return as;
  }

  @override
  WorkSpaceresenter createPresenter() {
    return WorkSpaceresenter();
  }
}
