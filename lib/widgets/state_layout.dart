
import 'package:flutter/cupertino.dart';
import 'package:mango/res/resources.dart';
import 'package:mango/util/utils.dart';

class StateLayout extends StatefulWidget {
  
  const StateLayout({
    Key key,
    @required this.type,
    this.hintText
  }):super(key: key);
  
  final StateType type;
  final String hintText;
  
  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  
  String _img;
  String _hintText;
  
  @override
  Widget build(BuildContext context) {
    switch (widget.type){
      case StateType.nopage:
        _img = "nopage";
        _hintText = "页面不存在";
        break;
      case StateType.loading:
        _img = "";
        _hintText = "";
        break;
      case StateType.empty:
        _img = "";
        _hintText = "";
        break;
    }
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.type == StateType.loading ? CupertinoActivityIndicator(radius: 16.0) :
          (widget.type == StateType.empty ? SizedBox() :
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Utils.getImgPath("state/$_img")),
              ),
            ),
          )),
          Gaps.vGap16,
          Text(
            widget.hintText ?? _hintText,
            style: TextStyles.textGray14,
          ),
          Gaps.vGap50,
        ],
      ),
    );
  }
}

enum StateType {
  nopage,
  /// 加载中
  loading,
  /// 空
  empty
}