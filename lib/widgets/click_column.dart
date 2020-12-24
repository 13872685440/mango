import 'package:flutter/material.dart';
import '../res/resources.dart';
import '../util/image_utils.dart';

class ClickColumn extends StatelessWidget {
  const ClickColumn(
      {Key key,
      this.onTap,
      @required this.title,
      this.icon,
      this.margin,
      this.content: "",
      this.textAlign: TextAlign.start,
      this.style: TextStyles.textDark16,
      this.maxLines: 1,
      this.isbutton: false})
      : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLines;
  final Icon icon;
  final EdgeInsets margin;
  final bool isbutton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 55.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            margin: margin == null ? EdgeInsets.only() : margin,
            child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildRowBody())
                    ]))));
  }

  _buildRowBody() {
    if (isbutton) {
      return <Widget>[
        Text(title, style: style, textAlign: textAlign),
      ];
    } else {
      if (icon == null) {
        return <Widget>[
          Text(title, style: style, textAlign: textAlign),
          Spacer(flex: 2),
          Opacity(
            // 无点击事件时，隐藏箭头图标
            opacity: onTap == null ? 0 : 1,
            child: loadAssetImage("ic_arrow_right", height: 16.0, width: 16.0),
          )
        ];
      } else {
        return <Widget>[
          Padding(padding: EdgeInsets.only(right: 10.0), child: icon),
          Text(title, style: style, textAlign: textAlign),
          Spacer(flex: 2),
          Opacity(
            // 无点击事件时，隐藏箭头图标
            opacity: onTap == null ? 0 : 1,
            child: loadAssetImage("ic_arrow_right", height: 16.0, width: 16.0),
          )
        ];
      }
    }
  }
}
