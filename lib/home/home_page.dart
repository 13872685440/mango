import 'package:flutter/material.dart';
import '../base/base_presenter.dart';
import '../base/base_submit_state.dart';
import '../home/statistics.dart';
import '../home/workplace_page.dart';
import '../util/toast.dart';
import '../util/utils.dart';

import '404.dart';
import 'my_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class HomePresenter extends BasePresenter<_HomeState> {}

class _HomeState extends BaseSubmitState<Home, HomePresenter>
    with SingleTickerProviderStateMixin {
  static List tabData = [
    {'text': '工作台', 'icon': Icon(IconData(61819, fontFamily: 'Feather'))},
    {'text': '通讯录', 'icon': Icon(IconData(61947, fontFamily: 'Feather'))},
    {'text': '统计', 'icon': Icon(IconData(61931, fontFamily: 'Feather'))},
    {'text': '我', 'icon': Icon(IconData(61942, fontFamily: 'Feather'))}
  ];
  List<Widget> list = List();
  int _currentIndex = 0;
  String appBarTitle = tabData[0]['text'];
  List<BottomNavigationBarItem> myTabs = [];
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    iniData();
  }

  void iniData() {
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    list.add(WorkSpace());
    list.add(WidgetNotFound());
    list.add(Statistics());
    list.add(My());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _isExit,
        child: Scaffold(
          body: PageView(
              controller: _pageController,
              onPageChanged: _itemTapped,
              children: list // 禁止滑动
              ),
          bottomNavigationBar: BottomNavigationBar(
            items: myTabs,
            //高亮  被点击高亮
            currentIndex: _currentIndex,
            //修改 页面
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            //shifting :按钮点击移动效果
            //fixed：固定
            type: BottomNavigationBarType.fixed,

            fixedColor: Color(0xFFC91B3A),
          ),
        ));
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }

  @override
  HomePresenter createPresenter() {
    return HomePresenter();
  }

  DateTime _lastTime;

  Future<bool> _isExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      Toast.show("再次点击退出应用");
      return Future.value(false);
    }
    Toast.cancelToast();
    return Utils.pop();
  }
}
