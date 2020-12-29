import 'package:flutter/material.dart';
import 'package:mango/res/colors.dart';
import 'package:mango/widgets/app_bar.dart';
import 'package:mango/widgets/message_column.dart';
import '../base/base_presenter.dart';
import '../base/base_submit_state.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class Messageresenter extends BasePresenter<_MessageState> {}

class _MessageState extends BaseSubmitState<Message, Messageresenter>
    with SingleTickerProviderStateMixin {
  bool isOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "工作台",
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MessageColumn(
                  title: "打卡",
                  icon: Icon(IconData(61838, fontFamily: 'Feather'),
                      color: Colors.white),
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10)),
              Container(
                  height: 0.6,
                  width: double.infinity,
                  color: Colours.line,
                  margin: const EdgeInsets.only(left: 16.0)),
              MessageColumn(
                  title: "待办",
                  color: Colors.orange,
                  icon: Icon(IconData(61785, fontFamily: 'Feather'),
                      color: Colors.white),
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10)),
              Container(
                  height: 0.6,
                  width: double.infinity,
                  color: Colours.line,
                  margin: const EdgeInsets.only(left: 16.0)),
              MessageColumn(
                  title: "消息",
                  color: Colors.pinkAccent,
                  icon: Icon(IconData(61836, fontFamily: 'Feather'),
                      color: Colors.white),
                  onTap: () {},
                  margin: EdgeInsets.only(top: 10)),
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

  @override
  Messageresenter createPresenter() {
    return Messageresenter();
  }
}
